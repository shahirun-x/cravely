import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  // Lightweight cookie check — no network calls to Supabase
  const session =
    request.cookies.get("sb-access-token") ||
    request.cookies.get("sb-wokowjtzkbfvewlkfduj-auth-token");

  const protectedRoutes = ["/chat", "/onboarding", "/profile"];
  const isProtected = protectedRoutes.some((route) =>
    request.nextUrl.pathname.startsWith(route)
  );

  if (isProtected && !session) {
    return NextResponse.redirect(new URL("/login", request.url));
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/chat/:path*", "/onboarding/:path*", "/profile/:path*"],
};
