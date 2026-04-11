import Link from "next/link";

const STATS = [
  "200+ Restaurants",
  "6 Neighborhoods",
  "Real-time AI",
];

export default function Home() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center px-4 bg-bg-primary">
      <div className="text-center max-w-2xl mx-auto">
        {/* Pill badge */}
        <span className="pill-badge inline-block mb-8">
          AI-Powered Food Discovery
        </span>

        {/* Headline */}
        <h1 className="heading-lg mb-6">
          Find your next favourite meal
        </h1>

        {/* Subheadline */}
        <p className="text-lg text-text-secondary max-w-xl mx-auto mb-10 leading-relaxed">
          Ask Cravely anything. Biryani near T.&nbsp;Nagar, veg cafes in Adyar,
          late-night food in OMR.
        </p>

        {/* CTA */}
        <Link href="/login" className="btn-accent text-lg">
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
  );
}
