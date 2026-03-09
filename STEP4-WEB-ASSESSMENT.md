# Step 4: Web Repo Assessment

**Deliverable for:** CC-Chat (Step 5 review)
**Date:** 2026-03-05

---

## Current State

The web repo is empty — planning docs only, no code. We're building from scratch.

---

## Recommendation: Astro + Stripe Payment Links

### Framework: Astro

**Why Astro over alternatives:**

| Option | Verdict |
|---|---|
| **Astro** | Purpose-built for content/marketing sites. Zero JS shipped by default. Markdown support for legal pages. Component-based (shared header/footer/layout). Fast builds. |
| Plain HTML | Works but no shared layouts — header/footer duplicated across 7+ pages. Maintenance pain. |
| SvelteKit | Chauncy app uses it, but overkill for a marketing site. Ships a JS runtime for no reason. |
| Hugo | Fast, but Go templates are awkward. Less ecosystem for interactive bits (waitlist form, Stripe). |
| 11ty | Solid, but Astro has better DX and component story. |

**Astro specifics:**
- Pages are `.astro` files (HTML-like, zero learning curve)
- Legal pages (Privacy, Terms, Return) can be plain Markdown files
- Shared layout component wraps all pages (header, footer, meta tags)
- Interactive islands only where needed (waitlist form, pricing toggle)
- Built-in sitemap, SEO, image optimization
- Static output — just HTML/CSS/JS files, no server

### Hosting: Cloudflare Pages

**Why:**
- Free tier covers this easily
- Global CDN (fast everywhere)
- Custom domain (chauncy.dev) with free SSL
- Git-push deploys (push to main → live in seconds)
- Cloudflare Workers available if we need a serverless function later (webhook handler for license delivery)
- No server to maintain, patch, or pay for

Alternatives: Netlify or Vercel work too, but Cloudflare gives us Workers on the same platform if we need them for Stripe webhooks.

### Payment: Stripe Payment Links → Checkout

**Phase 1 (launch):**
- **Stripe Payment Links** — create two links in Stripe dashboard:
  - $89 launch price (limited to 100)
  - $129 regular price
- Buy button on site points to Payment Link
- Stripe hosts the checkout page (PCI compliant, no code needed)
- Success URL redirects back to chauncy.dev/thank-you with download instructions

**Phase 2 (when needed):**
- Stripe Checkout Sessions via Cloudflare Worker for more control
- Webhook handler for automated license key delivery
- Programmatic tracking of the 100-license launch cap

**Why Payment Links first:**
- Zero backend code at launch
- Stripe handles tax, receipts, refunds dashboard
- 14-day money-back guarantee managed through Stripe dashboard
- Can switch to Checkout Sessions later without changing the site (just swap the URL)

### Download Delivery

**Simplest approach for launch:**
- Thank-you page with download links (Windows .exe, Linux AppImage)
- Links point to GitHub Releases or Cloudflare R2 storage
- Stripe receipt email includes link back to thank-you page
- No license key system needed at launch (can add later)

**Why no license keys at launch:**
- Adds complexity (key generation, validation, delivery, support)
- For a desktop app with no cloud features, piracy risk is low
- Focus on getting the first 100 paying users, not DRM
- Can retrofit license keys later if needed

---

## Proposed Site Structure

```
chauncy.dev/
├── /                    # Hero + features section + CTA (features inline, not separate page)
├── /pricing             # Pricing card + buy button
├── /faq                 # Common questions
├── /privacy             # Privacy Policy (Markdown)
├── /terms               # Terms of Service (Markdown)
├── /returns             # Return/Refund Policy (Markdown)
├── /thank-you           # Post-purchase: download links
└── /waitlist            # macOS waitlist signup (or section on pricing page)
```

All pages share a common layout (nav, footer, meta).

---

## Repo Structure

```
ChauncyWeb/
├── astro.config.mjs         # Astro config
├── package.json
├── LAUNCH-PLAN.md
├── CHAUNCY-APP-SUMMARY.md
├── src/
│   ├── layouts/
│   │   └── Base.astro       # Shared layout (head, nav, footer)
│   ├── pages/
│   │   ├── index.astro      # Home/hero
│   │   ├── features.astro
│   │   ├── pricing.astro
│   │   ├── faq.astro
│   │   ├── thank-you.astro
│   │   ├── waitlist.astro
│   │   ├── privacy.md       # Markdown → auto-rendered
│   │   ├── terms.md
│   │   └── returns.md
│   ├── components/
│   │   ├── Header.astro
│   │   ├── Footer.astro
│   │   ├── PricingCard.astro
│   │   ├── FeatureCard.astro
│   │   └── WaitlistForm.astro
│   └── styles/
│       └── global.css
├── public/
│   ├── favicon.ico
│   └── images/
└── dist/                    # Build output (deployed)
```

---

## macOS Waitlist

**Simplest approach:**
- A `<form>` that submits email to a Cloudflare Worker
- Worker stores email in Cloudflare KV (free tier: 100K reads/day, 1K writes/day)
- Or: embed a Buttondown/Mailchimp form if Jay prefers managed email

No third-party signup tool needed unless we want drip emails later.

---

## Infrastructure Notes

- **Domain registrar:** Porkbun (chauncy.dev)
- **Current hosting:** SiteGround (chauncy.dev parked, jaykeenan.net is Jay's primary email — do not touch)
- **Migration:** Point chauncy.dev nameservers from Porkbun to Cloudflare; SiteGround unaffected
- **Cloudflare account:** Needs to be created (free tier)

---

## What This Costs

| Item | Cost |
|---|---|
| Cloudflare Pages hosting | Free |
| Cloudflare domain (if transferring) | At-cost (~$10/yr for .dev) |
| Stripe fees | 2.9% + $0.30 per transaction |
| Astro | Free (open source) |
| **Total fixed cost** | **~$10/yr** |

---

## Build Timeline Estimate

| Step | What |
|---|---|
| Step 6 | Scaffold: Astro project, layout, all pages with placeholder content |
| Step 7 | CC-Chat delivers final copy |
| Step 8 | Integrate copy, wire Stripe Payment Links, set up Cloudflare Pages, configure chauncy.dev DNS |

---

## Decisions Needed from CC-Chat (Step 5)

1. **Astro as framework** — agree/disagree?
2. **Cloudflare Pages for hosting** — agree/disagree?
3. **Stripe Payment Links for launch** (no license keys) — acceptable?
4. **Download delivery via thank-you page** (no license key gating) — acceptable?
5. **macOS waitlist approach** — simple email form vs. managed email service?
6. **Site structure** — pages listed above cover everything?
