# Cravely Monorepo Scaffolding

Set up a production-grade monorepo with Next.js 15 frontend, FastAPI backend, shared types package, and Supabase schema.

## Proposed Changes

### Root Monorepo Config

#### [NEW] [package.json](file:///c:/Users/user/Desktop/Shahirun/Cravely/package.json)
- npm workspaces pointing to `apps/*` and `packages/*`
- `private: true`, name `cravely`

#### [NEW] [.gitignore](file:///c:/Users/user/Desktop/Shahirun/Cravely/.gitignore)
- Standard ignores: `node_modules/`, `.next/`, `.env*`, `__pycache__/`, `.venv/`, etc.

#### [NEW] [README.md](file:///c:/Users/user/Desktop/Shahirun/Cravely/README.md)
- Monorepo overview, folder structure diagram, setup instructions for both apps

---

### Next.js Frontend (`apps/web`)

#### Initialize via `npx create-next-app`
- Next.js 15, App Router, TypeScript, Tailwind CSS v4, ESLint
- Install `@supabase/ssr` and `@supabase/supabase-js`
- Initialize Shadcn/ui via `npx shadcn@latest init`

#### [NEW] [.env.local.example](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/web/.env.local.example)
- Placeholders: `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY`, `NEXT_PUBLIC_API_URL`

#### [MODIFY] [page.tsx](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/web/app/page.tsx)
- Replace default content with `<h1>Cravely</h1>`

#### [NEW] [client.ts](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/web/lib/supabase/client.ts)
- Browser-side Supabase client using `createBrowserClient` from `@supabase/ssr`

#### [NEW] [server.ts](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/web/lib/supabase/server.ts)
- Server-side Supabase client using `createServerClient` with cookie handling

---

### FastAPI Backend (`apps/api`)

#### [NEW] Folder structure
- `app/agent/`, `app/tools/`, `app/routes/`, `app/db/`, `app/models/` — each with `__init__.py`

#### [NEW] [requirements.txt](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/api/requirements.txt)
- All specified packages: fastapi, uvicorn, psycopg[binary], pgvector, google-generativeai, langgraph, langchain-google-genai, upstash-redis, python-dotenv, pydantic

#### [NEW] [main.py](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/api/main.py)
- FastAPI app with CORS (allow Next.js origin), `/health` endpoint

#### [NEW] [.env.example](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/api/.env.example)
- Placeholders for all specified env vars

#### [NEW] [README.md](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/api/README.md)
- Virtual environment setup and run instructions

---

### Supabase Database Schema

#### [NEW] [schema.sql](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/api/db/schema.sql)
- pgvector extension, all 13 tables in dependency order, all specified indexes

---

### Shared Types Package (`packages/types`)

#### [NEW] [package.json](file:///c:/Users/user/Desktop/Shahirun/Cravely/packages/types/package.json)
- Package name `@cravely/types`, TypeScript config

#### [NEW] [index.ts](file:///c:/Users/user/Desktop/Shahirun/Cravely/packages/types/index.ts)
- Placeholder export

---

## Verification Plan

### Automated Tests

1. **Next.js boots**: Run `npm run dev` in `apps/web`, verify it compiles and serves on `localhost:3000`
2. **FastAPI boots**: Install deps via `pip install -r requirements.txt`, run `uvicorn main:app`, hit `/health` endpoint to verify `{"status": "ok", "service": "cravely-api"}`
3. **Schema validation**: Verify `schema.sql` exists and contains all 13 tables and all indexes via grep checks

### Manual Verification
- Open `http://localhost:3000` in browser and confirm `<h1>Cravely</h1>` renders
- Curl `http://localhost:8000/health` and confirm the JSON response
