import logging
import os
import sys
from contextlib import asynccontextmanager

from dotenv import load_dotenv

# Load environment variables before anything else
load_dotenv()

# ---------------------------------------------------------------------------
# Startup env var validation — fail fast so Railway shows the error clearly
# ---------------------------------------------------------------------------
_REQUIRED_ENV_VARS = [
    "SUPABASE_DATABASE_URL",
    "SUPABASE_URL",
    "SUPABASE_ANON_KEY",
    "GROQ_API_KEY",
    "GOOGLE_GEMINI_API_KEY",
    "UPSTASH_REDIS_REST_URL",
    "UPSTASH_REDIS_REST_TOKEN",
]

def _check_required_env_vars() -> None:
    missing = [v for v in _REQUIRED_ENV_VARS if not os.getenv(v)]
    if missing:
        sys.exit(
            f"[startup] Missing required environment variables: {', '.join(missing)}\n"
            "Set them in Railway's Variables panel before deploying."
        )

_check_required_env_vars()

from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from slowapi import _rate_limit_exceeded_handler
from slowapi.errors import RateLimitExceeded
from slowapi.middleware import SlowAPIMiddleware

from google import genai

from app.agent.nodes import set_gemini_client as set_nodes_client
from app.db.connection import open_pool, close_pool
from app.middleware.blocklist import IPBlocklistMiddleware
from app.middleware.logging import RequestLoggingMiddleware
from app.middleware.ratelimit import RedisRateLimitMiddleware
from app.limiter import limiter
from app.routes.chat import router as chat_router
from app.tools.search import set_gemini_client as set_tools_client

logger = logging.getLogger(__name__)


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Startup/shutdown lifecycle for database pool + Gemini client."""
    gemini_key = os.getenv("GOOGLE_GEMINI_API_KEY")
    if gemini_key:
        client = genai.Client(api_key=gemini_key)
        app.state.gemini = client
        set_nodes_client(client)
        set_tools_client(client)
        logger.info("Gemini client initialized")
    else:
        app.state.gemini = None
        logger.warning("GOOGLE_GEMINI_API_KEY not set — LLM features disabled")

    await open_pool()

    yield

    await close_pool()


app = FastAPI(
    title="Cravely API",
    description="AI-powered food discovery chatbot backend",
    version="0.1.0",
    lifespan=lifespan,
    openapi_url=None,
    docs_url=None,
    redoc_url=None,
)

# ---------------------------------------------------------------------------
# Middleware stack (outermost → innermost = registration order reversed)
# Register IP blocklist first so blocked IPs are rejected before any other work
# ---------------------------------------------------------------------------
app.add_middleware(IPBlocklistMiddleware)

# Request logging — runs after blocklist so blocked IPs are not logged as valid
app.add_middleware(RequestLoggingMiddleware)

# Upstash Redis-backed distributed rate limiting
app.add_middleware(RedisRateLimitMiddleware)

# In-process slowapi (per-route decorators)
app.state.limiter = limiter
app.add_exception_handler(RateLimitExceeded, _rate_limit_exceeded_handler)
app.add_middleware(SlowAPIMiddleware)

# ---------------------------------------------------------------------------
# CORS — tightly restricted
# ---------------------------------------------------------------------------
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "https://cravely-six.vercel.app",
        "http://localhost:3000",
    ],
    allow_credentials=True,
    allow_methods=["GET", "POST", "OPTIONS"],
    allow_headers=["Content-Type", "Authorization", "X-Session-ID"],
    max_age=600,
)

# ---------------------------------------------------------------------------
# Security headers
# ---------------------------------------------------------------------------
@app.middleware("http")
async def add_security_headers(request: Request, call_next):
    response = await call_next(request)
    response.headers["X-Content-Type-Options"] = "nosniff"
    response.headers["X-Frame-Options"] = "DENY"
    response.headers["X-XSS-Protection"] = "1; mode=block"
    response.headers["Referrer-Policy"] = "strict-origin-when-cross-origin"
    response.headers["Permissions-Policy"] = "camera=(), microphone=(), geolocation=()"
    response.headers["Content-Security-Policy"] = "default-src 'self'"
    response.headers["Strict-Transport-Security"] = "max-age=31536000; includeSubDomains"
    return response

# ---------------------------------------------------------------------------
# Exception handlers
# ---------------------------------------------------------------------------
@app.exception_handler(Exception)
async def unhandled_exception_handler(request: Request, exc: Exception):
    logger.exception("Unhandled error on %s %s", request.method, request.url.path)
    return JSONResponse(status_code=500, content={"error": "Something went wrong"})

@app.exception_handler(RateLimitExceeded)
async def rate_limit_handler(request: Request, exc: RateLimitExceeded):  # noqa: ARG001
    return JSONResponse(
        status_code=429,
        content={"error": "Rate limit exceeded. Try again later."},
    )

# ---------------------------------------------------------------------------
# Routers
# ---------------------------------------------------------------------------
app.include_router(chat_router, prefix="/api/v1", tags=["chat"])

from app.routes.search import router as search_router
app.include_router(search_router, tags=["search"])

from app.routes.whatsapp import router as whatsapp_router
app.include_router(whatsapp_router, prefix="/api/v1", tags=["whatsapp"])

from app.routes.admin import router as admin_router
app.include_router(admin_router, tags=["admin"])


@app.get("/health")
async def health_check():
    return {"status": "ok"}
