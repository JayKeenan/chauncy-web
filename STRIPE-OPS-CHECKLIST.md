# Stripe / Ops Checklist (manual)

These require the Stripe Dashboard or your mailbox. Check off when done.

## Payment Link (launch $99)

Payment Link currently on site:  
`https://buy.stripe.com/eVq8wPaNo7k71gVb2U57W03`

- [ ] Open [Stripe Payment Links](https://dashboard.stripe.com/payment-links)
- [ ] Confirm amount is **$99** (or create a new link and update `src/pages/pricing.astro`)
- [ ] **After payment → redirect** set to: `https://chauncy.dev/thank-you`
- [ ] Optional: confirmation message includes download URL + support@chauncy.dev
- [ ] Optional: create **$149** Payment Link for after first 100 sales

## Receipt email

- [ ] Stripe → Settings → Customer emails: receipts enabled
- [ ] Custom text (if available on your plan) paste from `GTM-SOFT-LAUNCH.md` buyer email
- [ ] Or: manual follow-up from support@chauncy.dev for early buyers

## Support

- [ ] Confirm you can **receive** mail at support@chauncy.dev  
  (DNS already points MX to Fastmail: messagingengine.com)
- [ ] Confirm you can **send** from support@chauncy.dev
- [ ] Send a test message to yourself and reply

## First-100 tracking

- [ ] Use table in `GTM-SOFT-LAUNCH.md` or Stripe Dashboard filters
- [ ] At sale #100, swap site CTA to $149 link

## Buy-test (you, once)

- [ ] Complete a real or Stripe test-mode purchase
- [ ] Land on /thank-you
- [ ] Download installer
- [ ] Install on Windows 10/11
- [ ] Ingest ~20 documents, run a semantic search
- [ ] Note any first-run failures for product-firstrun work
