# Cravely

AI-powered food discovery chatbot — find the best restaurants, dishes, and personalized recommendations in your city.

## Monorepo Structure

```
cravely/
├── apps/
│   ├── web/                  ← Next.js 15 (App Router) frontend
│   └── api/                  ← FastAPI (Python) backend
├── packages/
│   └── types/                ← Shared TypeScript types
├── .gitignore
├── README.md
└── package.json              ← Root workspace config (npm workspaces)
```

## Prerequisites

- **Node.js** >= 18
- **Python** >= 3.11
- **npm** >= 9
- **Supabase** account with a project created

## Getting Started

### 1. Install Node dependencies

From the repo root:

```bash
npm install
```

This installs dependencies for all workspaces (`apps/web`, `packages/types`).

### 2. Set up the frontend

```bash
cd apps/web
cp .env.local.example .env.local
# Fill in your Supabase and API keys in .env.local
npm run dev
```

The frontend runs at [http://localhost:3000](http://localhost:3000).

### 3. Set up the backend

```bash
cd apps/api
python -m venv .venv

# Windows
.venv\Scripts\activate
# macOS / Linux
source .venv/bin/activate

pip install -r requirements.txt
cp .env.example .env
# Fill in your keys in .env
uvicorn main:app --reload --port 8000
```

The API runs at [http://localhost:8000](http://localhost:8000). Health check: `GET /health`.

### 4. Set up the database

1. Open your Supabase project's SQL Editor.
2. Paste the contents of `apps/api/db/schema.sql`.
3. Run the query.

## Workspaces

| Workspace | Path | Description |
|---|---|---|
| `@cravely/web` | `apps/web` | Next.js 15 frontend with Tailwind CSS v4 and Shadcn/ui |
| `@cravely/api` | `apps/api` | FastAPI backend with LangGraph agent |
| `@cravely/types` | `packages/types` | Shared TypeScript type definitions |
