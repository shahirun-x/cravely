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

# CORS — allow the Next.js frontend origin
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "http://127.0.0.1:3000",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(chat_router, prefix="/api/v1", tags=["chat"])


@app.get("/health")
async def health_check():
    return {"status": "ok", "service": "cravely-api"}
