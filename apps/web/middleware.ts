import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

export function middleware(request: NextRequest) {
  const cookies = request.cookies.getAll()
  const hasSession = cookies.some(cookie => 
    cookie.name.startsWith('sb-') && cookie.name.includes('-auth-token')
  )
  
  const protectedRoutes = ['/chat', '/onboarding', '/profile']
  const isProtected = protectedRoutes.some(route => 
    request.nextUrl.pathname.startsWith(route)
  )
  
  if (isProtected && !hasSession) {
    return NextResponse.redirect(new URL('/login', request.url))
  }
  
  // If already logged in and hitting /login, redirect to /chat
  if (request.nextUrl.pathname === '/login' && hasSession) {
    return NextResponse.redirect(new URL('/chat', request.url))
  }
  
  return NextResponse.next()
}

export const config = {
  matcher: ['/chat/:path*', '/onboarding/:path*', '/profile/:path*', '/login']
}
