# Chauncy.dev Launch Plan

**Project:** Chauncy.dev marketing site + distribution
**Model:** Desktop app, paid, no SaaS
**Last Updated:** 2026-03-09 (rev 3)

---

## Partners

| Partner | Role |
|---|---|
| Jay | Owner, decision-maker |
| Claude Chat (CC-Chat) | Copy, positioning, legal, product strategy |
| Claude Code (CC) | Build, infrastructure, Stripe, deployment |

---

## Steps

| # | Owner | Task | Status | Notes |
|---|---|---|---|---|
| 1 | Jay + CC | CC produces markdown summary of Chauncy app: features, platform targets, build/distribution state, anything user-facing | ✅ Complete | CHAUNCY-APP-SUMMARY.md delivered |
| 2 | Jay + CC-Chat | CC-Chat drafts positioning statement, feature copy, pricing recommendation, page structure outline | ✅ Complete | Positioning, audience, page structure drafted |
| 3 | Jay + CC-Chat | Pricing and product decision: one-time vs. subscription, tier structure, license delivery approach | ✅ Complete | See Decisions Log |
| 4 | Jay + CC | CC assesses web repo: framework, current state, recommendation for static site with Stripe | ✅ Complete | `STEP4-WEB-ASSESSMENT.md` delivered |
| 5 | Jay + CC-Chat | Review CC's tech recommendation, validate scope fit, agree on Stripe integration approach | ✅ Complete | Astro + Cloudflare Pages + Stripe Payment Links approved |
| 6 | Jay + CC | CC builds site scaffold: page structure, routing, placeholder content sections | ✅ Complete | Astro scaffold built, 8 pages, all building clean |
| 7 | Jay + CC-Chat | CC-Chat produces final copy for all pages: hero, features, pricing, FAQ, Privacy Policy, Terms of Service, Return Policy | ✅ Complete | CHAUNCY-SITE-COPY.md delivered |
| 8 | Jay + CC | CC integrates copy into scaffold, wires Stripe, connects download delivery, configures Chauncy.dev on SiteGround | 🔄 In Progress | Copy integrated; PostgreSQL refs fixed for SQLite migration; Stripe links wired; download links and SiteGround config pending |
| 9 | Jay + CC-Chat | Staging review: copy, flow, legal language; Jay documents issues | ⬜ Todo | Requires Step 8 |
| 10 | Jay + CC | CC resolves issues from staging review | ⬜ Todo | Requires Step 9 |
| 11 | Jay | Launch | ⬜ Todo | |

---

## Status Key

| Symbol | Meaning |
|---|---|
| ⬜ | Todo |
| 🔄 | In Progress |
| ✅ | Complete |
| 🚧 | Blocked |

---

## Decisions Log

| Date | Decision | Notes |
|---|---|---|
| 2026-03-05 | No SaaS — desktop app only | Distribution via Chauncy.dev |
| 2026-03-05 | Stripe or equivalent for payment | Specific approach TBD at Step 5 |
| 2026-03-05 | LAUNCH-PLAN.md lives in web repo root | CC maintains, both partners update |
| 2026-03-05 | Pricing: $129 one-time, $89 launch discount for first 100 licenses | Superseded 2026-07-28 |
| 2026-07-28 | Pricing: $149 one-time, $99 launch for first 100 licenses | Live on chauncy.dev; 14-day money-back |
| 2026-07-28 | Installer published on GitHub Releases | `JayKeenan/chauncy-web` tag `v0.1.0` |
| 2026-03-05 | macOS: top billing alongside Windows, listed as coming soon / in beta testing | Waitlist capture for Mac users; CC to prioritize testing |
| 2026-03-05 | Target audience: researchers, writers, consultants, analysts, students | Explicitly NOT compliance-regulated users (HIPAA, legal privilege, federal grant) |
| 2026-03-05 | Compliance carve-out language required | FAQ/privacy section must state Chauncy is not designed for regulated environments |
| 2026-03-05 | Platform launch: Windows + Linux at launch, macOS coming soon | Do not list macOS as available until tested |

---

## Open Questions

- License key delivery mechanism?
- Stripe Payment Links vs. embedded checkout?
- macOS waitlist mechanism — simple email form or third-party?
- macOS testing timeline — target date before or after launch?

---

## Update Protocol

After any significant step:
1. Update the Status column for completed steps
2. Add any decisions to the Decisions Log
3. Add new open questions as they arise
4. Commit with message: `docs: update LAUNCH-PLAN step [#]`
