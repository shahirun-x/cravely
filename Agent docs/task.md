# Cravely Monorepo Setup

## 1. Root Monorepo Structure
- [ ] Create root `package.json` with npm workspaces
- [ ] Create root `.gitignore`
- [ ] Create root `README.md`

## 2. Next.js 15 Frontend (`apps/web`)
- [ ] Initialize Next.js 15 with App Router, TypeScript, Tailwind CSS v4
- [ ] Install Supabase packages (`@supabase/ssr`, `@supabase/supabase-js`)
- [ ] Initialize Shadcn/ui
- [ ] Create `.env.local.example` with placeholders
- [ ] Create `lib/supabase/client.ts` (browser client)
- [ ] Create `lib/supabase/server.ts` (server client)
- [ ] Create basic `/` page rendering `<h1>Cravely</h1>`
- [ ] Verify app boots without errors

## 3. FastAPI Backend (`apps/api`)
- [ ] Create folder structure: `app/agent/`, `app/tools/`, `app/routes/`, `app/db/`, `app/models/`
- [ ] Create `requirements.txt`
- [ ] Create `main.py` with FastAPI app, CORS, `/health` endpoint
- [ ] Create `.env.example` with placeholders
- [ ] Create `README.md` with venv setup instructions

## 4. Supabase Database Schema
- [ ] Create `apps/api/db/schema.sql` with all 13 tables, extensions, and indexes

## 5. Shared Types Package (`packages/types`)
- [ ] Create `packages/types/package.json`
- [ ] Create `packages/types/index.ts` placeholder

## 6. Final Verification
- [ ] Next.js app boots without errors
- [ ] FastAPI `/health` endpoint responds correctly
- [ ] All `.env.example` files present
- [ ] `schema.sql` is complete and valid
