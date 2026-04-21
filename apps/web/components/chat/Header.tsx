"use client";

import { createClient } from "@/lib/supabase/client";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { useEffect, useState } from "react";
import { Heart, LogOut } from "lucide-react";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";

type View = "chat" | "search" | "map";

interface HeaderProps {
  activeView: View;
  onViewChange: (view: View) => void;
}

const VIEWS: { key: View; label: string }[] = [
  { key: "chat", label: "Chat" },
  { key: "search", label: "Search" },
  { key: "map", label: "Map" },
];

export default function Header({ activeView, onViewChange }: HeaderProps) {
  const router = useRouter();
  const [userName, setUserName] = useState("");

  useEffect(() => {
    const supabase = createClient();
    supabase.auth.getUser().then(({ data: { user } }) => {
      if (user) {
        setUserName(
          user.user_metadata?.full_name || user.email?.split("@")[0] || "U"
        );
      }
    });
  }, []);

  async function handleSignOut() {
    const supabase = createClient();
    await supabase.auth.signOut();
    router.push("/");
  }

  const initial = userName ? userName.charAt(0).toUpperCase() : "U";

  return (
    <header
      className="h-[60px] flex items-center justify-between px-5 shrink-0"
      style={{
        backgroundColor: "var(--bg-secondary)",
        borderBottom: "1px solid var(--border)",
      }}
    >
      {/* Logo */}
      <div className="shrink-0">
        <span className="text-lg font-extrabold text-text-primary">
          Cravely
        </span>
      </div>

      {/* View toggle — hidden on mobile, shown on desktop */}
      <div className="hidden md:flex items-center gap-1">
        {VIEWS.map((v) => (
          <button
            key={v.key}
            onClick={() => onViewChange(v.key)}
            className="px-4 py-1.5 text-sm font-medium transition-default cursor-pointer"
            style={{
              backgroundColor:
                activeView === v.key
                  ? "var(--accent-muted)"
                  : "transparent",
              color:
                activeView === v.key
                  ? "var(--accent)"
                  : "var(--text-muted)",
              borderRadius: "var(--radius-sm)",
            }}
          >
            {v.label}
          </button>
        ))}
      </div>

      {/* Favorites link */}
      <Link
        href="/favorites"
        className="shrink-0 w-8 h-8 flex items-center justify-center transition-default"
        style={{ borderRadius: "var(--radius-sm)", color: "var(--text-muted)" }}
        title="Saved restaurants"
      >
        <Heart className="w-5 h-5" />
      </Link>

      {/* User avatar dropdown */}
      <div className="shrink-0">
        <DropdownMenu>
          <DropdownMenuTrigger
            className="w-8 h-8 rounded-full flex items-center justify-center text-sm font-bold cursor-pointer transition-default outline-none"
            style={{
              backgroundColor: "var(--accent)",
              color: "#FFFFFF",
            }}
          >
            {initial}
          </DropdownMenuTrigger>
          <DropdownMenuContent
            align="end"
            className="w-44"
            style={{
              backgroundColor: "var(--bg-elevated)",
              border: "1px solid var(--border)",
            }}
          >
            <DropdownMenuItem
              onClick={handleSignOut}
              className="cursor-pointer text-sm gap-2"
              style={{ color: "var(--non-veg)" }}
            >
              <LogOut className="w-4 h-4" />
              Sign out
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </div>
    </header>
  );
}
