# Chauncy Monetization Todo

**Purpose:** Step-by-step checklist to make sales work, fix the site, and go to market.  
**How to use:** Mark items `[x]` when done. Work top to bottom within each phase.  
**Last updated:** 2026-07-28 (Stripe path verified)

---

## Phase 0 — Revenue readiness (do first)

Ship-blocking. Do not market until these are green.

- [x] **p0-publish-installer** — Publish Windows installer publicly (GitHub Release `v0.1.0` on `JayKeenan/chauncy-web`) with SHA-256  
  `FCA18F6E356DE7AA46CDAE650BFA80EF64D85CCB7F09FDB8A0761DD05DA6F70A`  
  URL: https://github.com/JayKeenan/chauncy-web/releases/download/v0.1.0/Chauncy_0.1.0_x64-setup.exe
- [x] **p0-fix-download-url** — Fix `/thank-you` download URL + correct SHA-256
- [x] **p0-stripe-success-url** — Live Payment Link confirmation page → `https://chauncy.dev/thank-you/`
- [x] **p0-buy-test** — Test-mode checkout → thank-you page; test refund processed
- [x] **p0-support-email** — support@chauncy.dev configured; bounce was typo (supoport)
- [x] **p0-align-pricing** — Locked **$99** / **$149**; site + docs aligned
- [x] **p0-license-claims** — Removed “license tied to email”; open download + 14-day refund (honest for launch)
- [x] **p0-version-label** — Market as **Windows Launch (build 0.1.0)** until app binary is rebuilt as 1.0.0

---

## Phase 1 — Website updates that unblocks sales

- [x] **site-remove-planned** — Removed “Planned launch price”; open-for-business language
- [x] **site-thankyou-onboarding** — Getting-started steps on thank-you page
- [x] **site-post-purchase-email** — Deferred: thank-you page is primary delivery; Stripe receipts optional
- [x] **site-real-screenshots** — Real workspace screenshot on home (`public/images/chauncy-workspace.png`)
- [ ] **site-demo-video** — Optional before soft launch (60–90s screen record)
- [x] **site-trust-seo** — Favicon SVG, OG/Twitter cards, system requirements on pricing
- [x] **site-conversion-copy** — Who-for/not-for + comparison vs PKM / desktop search / chatbots

---

## Phase 2 — Go to market

- [x] **gtm-soft-assets** — Drafts in `GTM-SOFT-LAUNCH.md` (Show HN, Reddit, emails, tracking table)
- [ ] **gtm-first-10** — Get first 10 paying customers *(you post/outreach)* ← **YOU ARE HERE**
- [ ] **gtm-track-100** — Track first-100 in Stripe; switch to $149 after cap *(you + Stripe)*

---

## Phase 3 — Product moves after first sales

- [ ] **product-firstrun** — Harden Windows first-run (app repo `/mnt/d/Chauncy`)
- [ ] **product-macos** — Ship macOS build; notify waitlist
- [ ] **product-roadmap** — Browser extension, OCR, license/portal if needed — see notes below

### Roadmap notes (product-roadmap)

| Item | Why later |
|------|-----------|
| Browser capture extension | Habit loop for web clips |
| OCR for scanned PDFs | Researchers with image-only PDFs |
| Simple license/portal | If leakage or support load demands it |

---

## Progress log

| Date | Item ID | Notes |
|------|---------|-------|
| 2026-07-28 | p0-publish-installer | Release v0.1.0 on chauncy-web; PE binary verified |
| 2026-07-28 | p0-fix-download-url | thank-you.astro → correct URL + SHA |
| 2026-07-28 | site + pricing batch | Screenshot, OG, who-for, compare, license language |
| 2026-07-28 | gtm-soft-assets | GTM-SOFT-LAUNCH.md + STRIPE-OPS-CHECKLIST.md |

---

## Done criteria (quick reference)

| Phase | Done when |
|-------|-----------|
| Phase 0 | A stranger can pay, download, install, and search their own docs |
| Phase 1 | Site looks trustworthy and explains what happens after buy |
| Phase 2 | First 10 paid users; feedback loop running |
| Phase 3 | Refund rate low; Mac/roadmap expand TAM |

---

*Update this file when marking items complete so progress survives across sessions.*
