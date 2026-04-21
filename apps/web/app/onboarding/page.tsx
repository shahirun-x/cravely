"use client";

import { useState, useCallback } from "react";
import { useRouter } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { createClient } from "@/lib/supabase/client";
import { createUserProfile, saveUserPreferences } from "@/lib/supabase/user";

const STEPS = [
  {
    question: "What do you usually prefer?",
    key: "dietary" as const,
    options: ["Vegetarian", "Non-Vegetarian", "Vegan", "Jain", "Halal"],
  },
  {
    question: "Which cuisines do you love?",
    key: "cuisines" as const,
    options: [
      "South Indian",
      "North Indian",
      "Chinese",
      "Chettinad",
      "Biryani",
      "Seafood",
      "Italian",
      "Street Food",
    ],
  },
  {
    question: "Which areas do you eat in?",
    key: "neighborhoods" as const,
    options: [
      "T. Nagar",
      "Adyar",
      "Mylapore",
      "Anna Nagar",
      "OMR",
      "Nungambakkam",
    ],
  },
];

export default function OnboardingPage() {
  const router = useRouter();
  const [step, setStep] = useState(0);
  const [direction, setDirection] = useState<"forward" | "backward">("forward");
  const [saving, setSaving] = useState(false);
  const [selections, setSelections] = useState<{
    dietary: string[];
    cuisines: string[];
    neighborhoods: string[];
  }>({
    dietary: [],
    cuisines: [],
    neighborhoods: [],
  });

  const current = STEPS[step];
  const currentSelections = selections[current.key];
  const isLast = step === STEPS.length - 1;

  const toggleOption = useCallback(
    (option: string) => {
      setSelections((prev) => {
        const arr = prev[current.key];
        const next = arr.includes(option)
          ? arr.filter((o) => o !== option)
          : [...arr, option];
        return { ...prev, [current.key]: next };
      });
    },
    [current.key]
  );

  async function handleNext() {
    if (isLast) {
      setSaving(true);
      try {
        const supabase = createClient();
        const { data: { user } } = await supabase.auth.getUser();

        if (!user) {
          router.push("/login");
          return;
        }

        await createUserProfile(
          supabase,
          user.id,
          user.user_metadata?.full_name || user.email || "User"
        );

        await saveUserPreferences(
          supabase,
          user.id,
          selections.dietary,
          selections.cuisines,
          selections.neighborhoods
        );

        router.push("/chat");
      } catch (err) {
        console.error("Onboarding save error:", err);
        setSaving(false);
      }
    } else {
      setDirection("forward");
      setStep((s) => s + 1);
    }
  }

  function handleBack() {
    setDirection("backward");
    setStep((s) => Math.max(0, s - 1));
  }

  return (
    <div
      className="min-h-screen flex flex-col bg-bg-primary"
      style={{ paddingBottom: "env(safe-area-inset-bottom)" }}
    >
      {/* Top bar */}
      <div
        className="flex items-center px-4 shrink-0"
        style={{
          height: "56px",
          paddingTop: "env(safe-area-inset-top)",
          borderBottom: "1px solid var(--border)",
          backgroundColor: "var(--bg-secondary)",
        }}
      >
        <button
          onClick={handleBack}
          className="flex items-center justify-center transition-default cursor-pointer"
          style={{
            visibility: step === 0 ? "hidden" : "visible",
            width: "44px",
            height: "44px",
            color: "var(--text-muted)",
            minHeight: "unset",
            minWidth: "unset",
          }}
        >
          <ChevronLeft className="w-5 h-5" />
        </button>

        {/* Progress bar */}
        <div className="flex-1 mx-4">
          <div
            className="h-1 rounded-full overflow-hidden"
            style={{ backgroundColor: "var(--border)" }}
          >
            <div
              className="h-full rounded-full transition-all duration-300"
              style={{
                width: `${((step + 1) / STEPS.length) * 100}%`,
                backgroundColor: "var(--accent)",
              }}
            />
          </div>
        </div>

        <span className="text-xs text-text-muted shrink-0" style={{ minWidth: "44px", textAlign: "right" }}>
          {step + 1} / {STEPS.length}
        </span>
      </div>

      {/* Step content */}
      <div
        key={step}
        className="flex-1 flex flex-col items-center justify-center px-6 py-10"
        style={{
          animation: `${direction === "forward" ? "slideInRight" : "slideInLeft"} 0.3s ease-out`,
        }}
      >
        <h2
          className="font-bold text-center mb-8 text-text-primary"
          style={{ fontSize: "clamp(1.5rem, 5vw, 1.75rem)", lineHeight: 1.2 }}
        >
          {current.question}
        </h2>

        {/* Option pills */}
        <div className="flex flex-wrap gap-3 justify-center w-full max-w-sm">
          {current.options.map((option) => {
            const selected = currentSelections.includes(option);
            return (
              <button
                key={option}
                onClick={() => toggleOption(option)}
                className="transition-default cursor-pointer"
                style={{
                  backgroundColor: selected
                    ? "rgba(255, 107, 53, 0.1)"
                    : "var(--bg-elevated)",
                  border: `2px solid ${selected ? "var(--accent)" : "var(--border)"}`,
                  borderRadius: "var(--radius-xl)",
                  padding: "12px 20px",
                  minHeight: "48px",
                  color: selected ? "var(--accent)" : "var(--text-secondary)",
                  fontSize: "15px",
                  fontWeight: selected ? 600 : 400,
                }}
              >
                {option}
              </button>
            );
          })}
        </div>
      </div>

      {/* Fixed bottom next button */}
      <div
        className="px-6 pt-3 shrink-0"
        style={{
          paddingBottom: "max(24px, env(safe-area-inset-bottom))",
          backgroundColor: "var(--bg-primary)",
          borderTop: "1px solid var(--border)",
        }}
      >
        <button
          onClick={handleNext}
          disabled={currentSelections.length === 0 || saving}
          className="w-full font-semibold text-white transition-default cursor-pointer disabled:opacity-40 disabled:cursor-not-allowed flex items-center justify-center gap-2"
          style={{
            backgroundColor: "var(--accent)",
            borderRadius: "var(--radius-xl)",
            height: "56px",
            fontSize: "16px",
          }}
        >
          {saving ? (
            <>
              <svg
                className="animate-spin h-4 w-4"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
              >
                <circle
                  className="opacity-25"
                  cx="12"
                  cy="12"
                  r="10"
                  stroke="currentColor"
                  strokeWidth="4"
                />
                <path
                  className="opacity-75"
                  fill="currentColor"
                  d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                />
              </svg>
              Saving...
            </>
          ) : isLast ? (
            "Finish"
          ) : (
            "Next"
          )}
        </button>
      </div>

      <style jsx>{`
        @keyframes slideInRight {
          from { opacity: 0; transform: translateX(30px); }
          to   { opacity: 1; transform: translateX(0); }
        }
        @keyframes slideInLeft {
          from { opacity: 0; transform: translateX(-30px); }
          to   { opacity: 1; transform: translateX(0); }
        }
      `}</style>
    </div>
  );
}
