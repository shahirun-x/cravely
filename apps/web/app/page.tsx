import Link from "next/link";

const STATS = [
  "200+ Restaurants",
  "6 Neighborhoods",
  "Real-time AI",
];

export default function Home() {
  return (
    <div
      className="min-h-screen flex flex-col bg-bg-primary"
      style={{ paddingBottom: "env(safe-area-inset-bottom)" }}
    >
      {/* Main content — vertically centered */}
      <div className="flex-1 flex flex-col items-center justify-center px-6 pt-16 sm:pt-24 pb-28 sm:pb-16">
        <div className="text-center w-full max-w-2xl mx-auto">
          {/* Pill badge */}
          <span className="pill-badge inline-block mb-8">
            AI-Powered Food Discovery
          </span>

          {/* Headline */}
          <h1
            className="font-bold leading-tight mb-6 text-text-primary"
            style={{ fontSize: "clamp(2rem, 8vw, 4rem)", lineHeight: 1.1 }}
          >
            Find your next favourite meal
          </h1>

          {/* Subheadline */}
          <p className="text-lg text-text-secondary max-w-xl mx-auto mb-10 leading-relaxed">
            Ask Cravely anything. Biryani near T.&nbsp;Nagar, veg cafes in Adyar,
            late-night food in OMR.
          </p>

          {/* CTA — hidden on mobile (sticky bar handles it) */}
          <Link href="/login" className="btn-accent text-lg hidden sm:inline-flex">
            Start Exploring
          </Link>

          {/* Stat pills */}
          <div className="mt-16 flex flex-wrap items-center justify-center gap-4">
            {STATS.map((stat) => (
              <span
                key={stat}
                className="card-base px-5 py-2.5 text-[13px] text-text-secondary"
              >
                {stat}
              </span>
            ))}
          </div>
        </div>
      </div>

      {/* Sticky mobile CTA — only on small screens */}
      <div
        className="sm:hidden fixed bottom-0 left-0 right-0 px-4 pt-3"
        style={{
          paddingBottom: "max(16px, env(safe-area-inset-bottom))",
          background: "linear-gradient(to top, #0A0A0A 60%, transparent)",
        }}
      >
        <Link
          href="/login"
          className="block w-full text-center font-semibold text-white"
          style={{
            backgroundColor: "var(--accent)",
            borderRadius: "var(--radius-xl)",
            height: "56px",
            lineHeight: "56px",
            fontSize: "18px",
          }}
        >
          Start Finding Food
        </Link>
      </div>
    </div>
  );
}
