# Cravely API

FastAPI backend for the Cravely food discovery chatbot.

## Setup

### 1. Create a virtual environment

```bash
python -m venv .venv
```

### 2. Activate the virtual environment

**Windows:**
```bash
.venv\Scripts\activate
```

**macOS / Linux:**
```bash
source .venv/bin/activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure environment variables

```bash
cp .env.example .env
# Edit .env with your actual keys
```

### 5. Run the development server

```bash
uvicorn main:app --reload --port 8000
```

The API will be available at [http://localhost:8000](http://localhost:8000).

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/health` | Health check — returns `{"status": "ok", "service": "cravely-api"}` |

## Project Structure

```
apps/api/
├── app/
│   ├── agent/       ← LangGraph agent logic
│   ├── tools/       ← Agent tool definitions
│   ├── routes/      ← API route handlers
│   ├── db/          ← Database utilities
│   └── models/      ← Pydantic models
├── db/
│   └── schema.sql   ← Supabase database schema
├── main.py          ← FastAPI app entrypoint
├── requirements.txt
├── .env.example
└── README.md
```
