"use client";

import { useState, useCallback } from "react";
import { useRouter } from "next/navigation";
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
        const {
          data: { user },
        } = await supabase.auth.getUser();

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
    <div className="min-h-screen flex flex-col items-center justify-center px-4 bg-bg-primary">
      <div
        className="w-full max-w-[520px] p-12"
        style={{
          backgroundColor: "var(--bg-card)",
          border: "1px solid var(--border)",
          borderRadius: "var(--radius-lg)",
        }}
      >
        {/* Dot indicators */}
        <div className="flex items-center justify-center gap-2 mb-6">
          {STEPS.map((_, i) => (
            <div
              key={i}
              className="w-2 h-2 rounded-full transition-default"
              style={{
                backgroundColor:
                  i === step ? "var(--accent)" : "var(--border)",
              }}
            />
          ))}
        </div>

        {/* Step label */}
        <p className="label-text text-center mb-6">
          Step {step + 1} of {STEPS.length}
        </p>

        {/* Question with slide transition */}
        <div
          key={step}
          className="animate-in"
          style={{
            animation: `${
              direction === "forward" ? "slideInRight" : "slideInLeft"
            } 0.3s ease-out`,
          }}
        >
          <h2 className="heading-md text-center mb-8">{current.question}</h2>

          {/* Pill buttons */}
          <div className="flex flex-wrap gap-3 justify-center mb-10">
            {current.options.map((option) => {
              const selected = currentSelections.includes(option);
              return (
                <button
                  key={option}
                  onClick={() => toggleOption(option)}
                  className="transition-default cursor-pointer"
                  style={{
                    backgroundColor: selected
                      ? "var(--accent-muted)"
                      : "var(--bg-elevated)",
                    border: `1px solid ${
                      selected ? "var(--accent)" : "var(--border)"
                    }`,
                    borderRadius: "var(--radius-xl)",
                    padding: "12px 20px",
                    color: selected
                      ? "var(--accent)"
                      : "var(--text-secondary)",
                    fontSize: "14px",
                    fontWeight: selected ? 600 : 400,
                  }}
                >
                  {option}
                </button>
              );
            })}
          </div>
        </div>

        {/* Navigation */}
        <div className="flex items-center justify-between">
          <button
            onClick={handleBack}
            className="text-sm font-medium text-text-muted transition-default cursor-pointer hover:text-text-secondary"
            style={{ visibility: step === 0 ? "hidden" : "visible" }}
          >
            Back
          </button>
          <button
            onClick={handleNext}
            disabled={currentSelections.length === 0 || saving}
            className="btn-accent flex-none disabled:opacity-40 disabled:cursor-not-allowed disabled:transform-none"
          >
            {saving ? (
              <span className="flex items-center gap-2">
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
              </span>
            ) : isLast ? (
              "Finish"
            ) : (
              "Next"
            )}
          </button>
        </div>
      </div>

      <style jsx>{`
        @keyframes slideInRight {
          from {
            opacity: 0;
            transform: translateX(30px);
          }
          to {
            opacity: 1;
            transform: translateX(0);
          }
        }
        @keyframes slideInLeft {
          from {
            opacity: 0;
            transform: translateX(-30px);
          }
          to {
            opacity: 1;
            transform: translateX(0);
          }
        }
      `}</style>
    </div>
  );
}
