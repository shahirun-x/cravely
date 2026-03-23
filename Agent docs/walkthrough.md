# Cravely Monorepo — Setup Walkthrough

## What Was Built

Complete monorepo scaffolding for the Cravely food discovery chatbot with two workspaces and a shared types package.

## File Structure

```
cravely/
├── apps/
│   ├── web/                     ← Next.js 15 (App Router, TS, Tailwind v4, Shadcn/ui)
│   │   ├── app/
│   │   │   ├── globals.css
│   │   │   ├── layout.tsx
│   │   │   └── page.tsx         ← Renders <h1>Cravely</h1>
│   │   ├── components/ui/
│   │   │   └── button.tsx       ← Shadcn button component
│   │   ├── lib/
│   │   │   ├── supabase/
│   │   │   │   ├── client.ts    ← Browser Supabase client
│   │   │   │   └── server.ts    ← Server Supabase client (cookies)
│   │   │   └── utils.ts         ← Shadcn cn() utility
│   │   ├── .env.local.example
│   │   └── package.json
│   └── api/                     ← FastAPI backend
│       ├── app/
│       │   ├── agent/
│       │   ├── tools/
│       │   ├── routes/
│       │   ├── db/
│       │   └── models/
│       ├── db/
│       │   └── schema.sql       ← 13 tables + pgvector + indexes
│       ├── main.py              ← FastAPI app with CORS + /health
│       ├── requirements.txt
│       ├── .env.example
│       └── README.md
├── packages/
│   └── types/
│       ├── index.ts
│       └── package.json
├── .gitignore
├── README.md
└── package.json                 ← npm workspaces root
```

## Verification Results

| Check | Result |
|-------|--------|
| Next.js 15 `next build` | ✅ Exit code 0, static pages generated |
| Shadcn/ui initialized | ✅ `button.tsx` + [utils.ts](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/web/lib/utils.ts) created |
| Supabase packages installed | ✅ `@supabase/ssr` + `@supabase/supabase-js` |
| [lib/supabase/client.ts](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/web/lib/supabase/client.ts) | ✅ Browser client with `createBrowserClient` |
| [lib/supabase/server.ts](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/web/lib/supabase/server.ts) | ✅ Server client with cookie handling |
| [.env.local.example](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/web/.env.local.example) (web) | ✅ 4 placeholders |
| [.env.example](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/api/.env.example) (api) | ✅ 5 placeholders |
| [schema.sql](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/api/db/schema.sql) | ✅ 13 tables, pgvector, 7 indexes |
| FastAPI [main.py](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/api/main.py) | ✅ CORS + `/health` endpoint |
| API folder structure | ✅ 5 subpackages with [__init__.py](file:///c:/Users/user/Desktop/Shahirun/Cravely/apps/api/app/__init__.py) |
| Root [README.md](file:///c:/Users/user/Desktop/Shahirun/Cravely/README.md) | ✅ Setup instructions for both apps |

## Schema Tables (13)

`cities` → `neighborhoods` → `cuisines` → `categories` → `restaurants` → `restaurant_cuisines` → `menu_items` → `users` → `user_preferences` → `conversations` → `messages` → `favorites`

## Next Steps

To start the FastAPI backend locally, create a venv and install deps:
```bash
cd apps/api && python -m venv .venv && .venv\Scripts\activate && pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```
