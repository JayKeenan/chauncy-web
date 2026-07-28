# support@chauncy.dev — quick check

**Why:** Buyers email this for help and refunds. Site, FAQ, and thank-you all list it.

**DNS (already OK):**
- MX → Fastmail (`messagingengine.com`)
- SPF includes Fastmail

---

## 5-minute test (you)

### Receive

1. From Gmail/Outlook/phone (any account **not** support@), send:

   - **To:** `support@chauncy.dev`  
   - **Subject:** `Chauncy support test`  
   - **Body:** `Test receive`

2. Open whatever inbox Fastmail delivers that to (mailbox or alias for support@).

3. Pass = message arrives within a few minutes.

### Send

1. **Reply** to that test from support@ (or compose new From: support@chauncy.dev).

2. Check the other account gets it, and that From shows `support@chauncy.dev` (not only a personal address unless that’s intentional).

### Refund path (mental dry-run)

When someone asks for a refund:

1. They email support@ with subject **Refund Request** + purchase email  
2. You find the payment in Stripe (Live) → Refund  
3. Reply from support@ confirming  

---

## If receive fails

- Fastmail: confirm alias/address `support@chauncy.dev` exists and isn’t discarded  
- Check spam  
- MX is correct — problem is almost always mailbox config, not DNS  

## If send fails or lands in spam

- Fastmail: sending domain / DKIM for chauncy.dev  
- Optional later: tighten SPF (`~all` instead of `?all`), add DMARC  

Not required before soft launch if receive + reply work.

---

## Done when

- [ ] Can receive at support@chauncy.dev  
- [ ] Can send/reply as support@ (or clearly from your monitored address)  
- [ ] You know which app/inbox to check daily at launch  
