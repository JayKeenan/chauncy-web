# Stripe walkthrough for Chauncy launch

**Time needed:** ~10–15 minutes  
**Goal:** After someone pays $99, Stripe sends them to the download page and emails a useful receipt.

**Already done on the site (no action):**
- Buy button points at: `https://buy.stripe.com/eVq8wPaNo7k71gVb2U57W03`
- Download page ready: `https://chauncy.dev/thank-you`
- Installer URL + SHA-256 on that page are live

---

## Part A — Payment Link redirect (required)

### 1. Open Payment Links
Go to: https://dashboard.stripe.com/payment-links  

*(Use **Live mode** toggle top-right — not Test — for real sales.)*

### 2. Find the $99 link
Look for the link whose URL ends in:

`eVq8wPaNo7k71gVb2U57W03`

Open it → **Edit** (pencil / ⋯ menu → Edit).

### 3. Confirm product basics
| Setting | Should be |
|--------|-----------|
| Price | **$99.00** one-time (not subscription) |
| Currency | USD (or your intended currency) |
| Product name | Something clear, e.g. **Chauncy for Windows — Launch** |

### 4. After payment → redirect (the important one)
Find **After payment** / **Confirmation page** / **Success**:

1. Choose **Don't show confirmation page** *or* the option that allows a **custom redirect**  
   *(Wording varies slightly by Stripe UI version.)*
2. Set redirect URL exactly:

```
https://chauncy.dev/thank-you
```

3. Save the Payment Link.

**What this does:** buyer pays → browser goes to your download page with the installer.

### 5. Quick self-check (no full charge required yet)
Optional lighter check:
- Open the Payment Link in a private window
- Confirm it loads and shows **$99**
- Full proof is Part D (test purchase)

---

## Part B — Customer receipt email (strongly recommended)

### 1. Open customer emails
https://dashboard.stripe.com/settings/emails  

### 2. Turn on receipts
- **Successful payments** → enable **Email customers for successful payments** (or equivalent)

### 3. Add custom text (if your UI allows)
Paste this into any “custom message” / “footer” / “statement descriptor description” field that shows on the receipt:

```
Thanks for buying Chauncy.

Download: https://chauncy.dev/thank-you
Install on Windows 10/11 (x64). Add documents, then search in plain English.

Support: support@chauncy.dev
14-day refund: email support with subject "Refund Request"
```

If there is **no** custom-message field, receipts still go out; you can forward the same text manually for early buyers.

### 4. Business details (if missing)
https://dashboard.stripe.com/settings/public  
Set public business name to **Chauncy** (or your legal name) so receipts look trustworthy.

---

## Part C — Optional but useful

### C1. Create the future $149 link (after first 100 sales)
1. Payment Links → **New**
2. One-time **$149**
3. Same redirect: `https://chauncy.dev/thank-you`
4. Save — **do not** put it on the site yet  
5. Keep the URL somewhere (Notes). When sale #100 hits, we’ll swap it into `src/pages/pricing.astro`.

### C2. Statement descriptor (card statement)
https://dashboard.stripe.com/settings/public  
Set short descriptor if available, e.g. `CHAUNCY` so buyers recognize the charge.

### C3. Refund readiness
You don’t configure a special “14-day button.” When someone asks:
1. Stripe → Payments → find charge  
2. **Refund**  
Matches your site Return Policy.

---

## Part D — End-to-end buy test (required before marketing)

### Option 1 — Live $99 (simplest truth)
1. Buy yourself via https://chauncy.dev/pricing  
2. After pay, you **must** land on https://chauncy.dev/thank-you  
3. Download + install on Windows  
4. Refund yourself in Stripe if you don’t want the charge  

### Option 2 — Test mode first
1. Stripe Dashboard → toggle **Test mode** ON  
2. Create a **test** Payment Link for $99 with redirect `https://chauncy.dev/thank-you`  
3. Pay with test card: `4242 4242 4242 4242`, any future expiry, any CVC  
4. Confirm redirect works  
5. Toggle back to **Live** and ensure the **live** link (on the site) has the same redirect  

**Pass criteria:**
- [ ] Redirect lands on `/thank-you`  
- [ ] Download button works  
- [ ] Receipt email arrives (live or test)  
- [ ] App installs and can search  

---

## Part E — What to tell me when you’re done

Reply with something like:

> Stripe done. Redirect works. Receipt on. Test purchase: yes/no.

Or if stuck, paste:
- Screenshot or exact error  
- Whether you’re in **Live** or **Test**  
- Whether you see an “After payment” / redirect field at all  

---

## What I cannot do for you

| Task | Why |
|------|-----|
| Log into dashboard.stripe.com | Needs your account |
| Set Payment Link redirect | Dashboard only (no API key here) |
| Enable receipt emails | Dashboard only |
| Complete a real card charge | Needs you + a card |
| Issue refunds | Dashboard only |

## What is already done without Stripe login

| Task | Status |
|------|--------|
| Site Buy button → Payment Link | Done |
| Thank-you page + installer + checksum | Done |
| Pricing $99 / $149 copy | Done |
| Support address on site | support@chauncy.dev |
| Soft-launch email copy | `GTM-SOFT-LAUNCH.md` |

---

## Minimal path (if short on time)

Do **only** this:

1. Live Payment Link → redirect → `https://chauncy.dev/thank-you` → Save  
2. Enable successful-payment emails  
3. One test purchase (test mode or live + refund)  
4. Tell me it worked  

Everything else can wait until after first strangers buy.
