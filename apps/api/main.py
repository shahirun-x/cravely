import logging
import os
from contextlib import asynccontextmanager

from dotenv import load_dotenv
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

# Load environment variables before anything else
load_dotenv()

from google import genai

from app.agent.nodes import set_gemini_client as set_nodes_client
from app.db.connection import open_pool, close_pool
from app.routes.chat import router as chat_router
from app.tools.search import set_gemini_client as set_tools_client

logger = logging.getLogger(__name__)


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Startup/shutdown lifecycle for database pool + Gemini client."""
    # Initialize Gemini client
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

    # Initialize DB pool
    await open_pool()

    yield

    await close_pool()


app = FastAPI(
    title="Cravely API",
    description="AI-powered food discovery chatbot backend",
    version="0.1.0",
    lifespan=lifespan,
)

# CORS — read allowed origins from env var
allowed_origins_str = os.getenv("ALLOWED_ORIGINS", "http://localhost:3000")
allowed_origins = [origin.strip() for origin in allowed_origins_str.split(",")]
print(f"CORS allowed origins: {allowed_origins}")

app.add_middleware(
    CORSMiddleware,
    allow_origins=allowed_origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(chat_router, prefix="/api/v1", tags=["chat"])
from app.routes.search import router as search_router
app.include_router(search_router, tags=["search"])
from app.routes.whatsapp import router as whatsapp_router
app.include_router(whatsapp_router, prefix="/api/v1", tags=["whatsapp"])
from app.routes.admin import router as admin_router
app.include_router(admin_router, tags=["admin"])


@app.get("/health")
async def health_check():
    return {"status": "ok", "service": "cravely-api"}
