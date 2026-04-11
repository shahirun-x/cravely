# Cravely Agent Rules

## DEPLOYMENT RULES — NEVER VIOLATE THESE

1. NEVER run `vercel`, `vercel --prod`, or any Vercel CLI command
2. NEVER run `railway up` or any Railway CLI command
3. Deployments are triggered automatically by `git push` to main branch
4. Vercel builds the frontend (apps/web) automatically from GitHub
5. Railway builds the backend (apps/api) automatically from GitHub

## ENVIRONMENT VARIABLES — NEVER TOUCH THESE

1. NEVER modify `apps/api/.env` — this is the production env file
2. NEVER commit `.env` files with real values
3. NEVER log or print API keys or secrets

## GIT RULES

1. Always commit to main branch
2. Always run `npm run build` in `apps/web` before committing to verify no build errors
3. Commit message format: `feat:`, `fix:`, `chore:` prefix required

## BACKEND RULES

1. FastAPI runs on Railway — never change the port from `$PORT`
2. Never hardcode localhost URLs in any file
3. All API URLs must come from environment variables

## FRONTEND RULES

1. Next.js runs on Vercel — root directory is `apps/web`
2. Never use `alert()` — all errors must be inline in the UI
3. Never hardcode `http://localhost:8000` — use `NEXT_PUBLIC_API_URL`
