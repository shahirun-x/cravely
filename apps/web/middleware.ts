import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

// ---------------------------------------------------------------------------
// Path traversal — literal and URL-encoded variants
// ---------------------------------------------------------------------------
const PATH_TRAVERSAL_RE = /(\.\.|%2e%2e|%2e\.|\.%2e)/i;

// ---------------------------------------------------------------------------
// Scanner / bot User-Agent patterns blocked in production
// ---------------------------------------------------------------------------
const SCANNER_UA_RE = /sqlmap|nikto|nmap|masscan|zgrab|dirbuster|gobuster|wfuzz|hydra|medusa|burpsuite|acunetix|nessus|openvas|w3af|havij|pangolin/i;

// Curl in production is blocked; curl/7.x is the typical automated-scan
// version prefix. curl used by real browsers or CI goes through server-side
// routes — no reason for it to hit the Next.js edge.
const CURL_PROD_RE = /^curl\//i;

function isBlockedUserAgent(ua: string): boolean {
  if (!ua) return true; // empty UA blocked unconditionally
  if (SCANNER_UA_RE.test(ua)) return true;
  if (process.env.NODE_ENV === 'production' && CURL_PROD_RE.test(ua)) return true;
  return false;
}

export function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl;
  const ua = request.headers.get('user-agent') ?? '';

  // --- Security gates (run before auth checks) ---

  if (PATH_TRAVERSAL_RE.test(pathname)) {
    return new NextResponse(null, { status: 400 });
  }

  if (isBlockedUserAgent(ua)) {
    return new NextResponse(null, { status: 400 });
  }

  // --- Auth guard ---

  const cookies = request.cookies.getAll()
  const hasSession = cookies.some(cookie =>
    cookie.name.startsWith('sb-') && cookie.name.includes('-auth-token')
  )

  const protectedRoutes = ['/chat', '/onboarding', '/profile', '/favorites']
  const isProtected = protectedRoutes.some(route =>
    request.nextUrl.pathname.startsWith(route)
  )

  if (isProtected && !hasSession) {
    return NextResponse.redirect(new URL('/login', request.url))
  }

  if (request.nextUrl.pathname === '/login' && hasSession) {
    return NextResponse.redirect(new URL('/chat', request.url))
  }

  return NextResponse.next()
}

export const config = {
  matcher: ['/chat/:path*', '/onboarding/:path*', '/profile/:path*', '/favorites/:path*', '/login', '/((?!_next/static|_next/image|favicon.ico).*)'],
}
