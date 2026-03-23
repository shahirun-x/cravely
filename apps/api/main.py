import os
from contextlib import asynccontextmanager

from dotenv import load_dotenv
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

# Load environment variables before anything else
load_dotenv()

import google.generativeai as genai

from app.db.connection import close_pool, init_pool
from app.routes.chat import router as chat_router

# Configure Gemini globally
gemini_key = os.getenv("GOOGLE_GEMINI_API_KEY")
if gemini_key:
    genai.configure(api_key=gemini_key)


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Startup/shutdown lifecycle for database pool."""
    await init_pool()
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
