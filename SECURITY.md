# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in Cravely, please **do not open a public GitHub issue**.

Report it privately by emailing **shahirun.pvt@gmail.com** with the subject line:
`[SECURITY] <brief description>`

Please include:
- A clear description of the vulnerability
- Steps to reproduce it
- The potential impact
- Any suggested remediation (optional)

You will receive an acknowledgement within **48 hours** and a status update within **7 days**.

We will not pursue legal action against researchers who report vulnerabilities responsibly and refrain from accessing, modifying, or deleting user data.

---

## Scope

### In Scope

| Target | Notes |
|--------|-------|
| `https://cravely-six.vercel.app` | Production frontend |
| `https://api-production-7458.up.railway.app` | Production API |
| Authentication flows (Supabase OAuth) | Login, session handling |
| Chat endpoint (`POST /api/v1/chat`) | Input validation, rate limiting |
| Search endpoint (`GET /search`) | Query injection, data exposure |

### Out of Scope

- Denial-of-service attacks
- Social engineering of maintainers
- Physical attacks
- Vulnerabilities in third-party services (Supabase, Railway, Vercel, Upstash) — report those directly to the vendor
- Issues in `node_modules` / `venv` dependencies without a working proof-of-concept showing impact on Cravely
- Self-XSS or attacks requiring physical device access
- Rate-limit bypass via residential proxies (acknowledged risk, not a vulnerability)

---

## Current Security Measures

### API (`apps/api`)

| Measure | Detail |
|---------|--------|
| Authentication | Supabase JWT validated on every protected route via `python-jose` |
| Rate limiting | Upstash Redis sliding-window: 100 req/min per IP globally, 20 req/min per IP on `/chat`, 50 msg/hour per user |
| Session flood guard | Sessions sending > 10 messages in 60 s are soft-blocked for 5 minutes |
| IP blocklist | `BLOCKED_IPS` env var; checked before any request processing |
| Input validation | Pydantic models with max-length, UUID format, city whitelist, SQL-pattern detection |
| Request size limit | 10 KB hard limit on `/chat` body |
| CORS | Restricted to `cravely-six.vercel.app` and `localhost:3000` |
| Security headers | `X-Frame-Options`, `X-Content-Type-Options`, `CSP`, `HSTS`, `Referrer-Policy`, `Permissions-Policy` |
| Error responses | All 500-class errors return `{"error": "Something went wrong"}` — no stack traces |
| Parameterised queries | All database queries use asyncpg `$1`/`$2` placeholders |
| SSL enforcement | `sslmode=require` appended to database URL at connection time |
| Admin endpoint | Double-gated: JWT + `X-Admin-Secret` header; IP logged on mismatch |
| Startup validation | Required env vars checked at boot; process exits immediately if any are missing |

### Frontend (`apps/web`)

| Measure | Detail |
|---------|--------|
| Auth source | `userId` always sourced from Supabase `auth.getSession()` — never from URL params or localStorage |
| CSP | `default-src 'self'` with explicit allowlists for Maps, Supabase, fonts |
| Security headers | Set via `next.config.ts` on all routes |
| API timeout | 10-second `AbortSignal.timeout` on all fetch calls |
| No `dangerouslySetInnerHTML` | AI responses rendered via `react-markdown` (parsed to React elements) |
| Error messages | Internal errors never echoed to users; generic messages only |
| Supabase client | `persistSession`, `autoRefreshToken`, `detectSessionInUrl` all explicitly enabled |
| Path traversal blocking | Middleware rejects requests containing `../` or `%2e%2e` |
| Scanner UA blocking | Known scanner User-Agents (sqlmap, nikto, etc.) blocked at middleware |

### Database (Supabase)

| Measure | Detail |
|---------|--------|
| Row Level Security | Enabled and forced on `users`, `user_preferences`, `conversations`, `messages`, `favorites` |
| RLS policies | Users can only read/write their own rows; see `apps/api/db/rls_policies.sql` |
| SSL | All connections require TLS (`sslmode=require`) |

### Secrets Management

- All credentials stored in Railway Variables (API) and Vercel Environment Variables (frontend)
- No secrets committed to the repository
- `.env`, `.env.local`, `.env.production`, `*.pem`, `*.key` are all `.gitignore`d

---

## Known Limitations

- The `/search` endpoint is unauthenticated (public read-only restaurant data)
- Rate limiting fails open if Upstash Redis is unavailable (availability prioritised over strict limiting)
- WhatsApp webhook always returns `200 OK` to Meta regardless of processing errors (required by Meta's webhook protocol)
