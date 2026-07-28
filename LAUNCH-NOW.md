# Chauncy — do this when you have energy

**Status:** Product + payment path ready. You only need to put links in front of people.  
**Site:** https://chauncy.dev  
**Support folder:** Fastmail → **Support** (support@chauncy.dev)

When fried: do **only Step A**. Stop. Come back later for B/C.

---

## Step A — 15 minutes (minimum viable launch)

### 1. Three personal messages (copy, change NAME)

**To:** friends / colleagues who drown in PDFs or email  

```
Hey NAME — I shipped a Windows app I've been building: Chauncy.
It's local search that finds docs by meaning (not just filename).
One-time $99, no account, files stay on your machine.
https://chauncy.dev
If you try it, I'd love any "this broke / this was confusing" notes.
```

Send to 3 people. Done is better than perfect.

### 2. One Reddit post

1. Go to https://www.reddit.com/r/PKM/submit  
2. Title + body = **Block 1** below  
3. Flair if required; don't crosspost the same hour  
4. Leave the tab open 20 min for replies if you can  

### 3. Stripe + mail

- Stripe Dashboard: **Test mode OFF**  
- Fastmail: glance at **Support** folder today/tomorrow  

---

## Step B — when you have another 20 minutes

### Hacker News

1. https://news.ycombinator.com/submit  
2. Title + URL or text = **Block 2**  
3. Best: weekday morning US; don't repost if it sinks  

### Short social

LinkedIn or X: **Block 3**

### Optional second Reddit (different day)

r/selfhosted or r/LocalLLaMA: **Block 4**  
(Label Windows-only; LocalLLaMA cares about local embeddings / Ollama)

---

## Step C — tracking (2 minutes per sale)

Stripe → Payments → when someone pays, add a row in `sales-log.md`.

After **100** live $99 sales: swap site to $149 link (we can do that together).

---

# Copy-paste blocks

## Block 1 — r/PKM

**Title:**
```
Local-first semantic search over a messy personal archive (Windows) — feedback welcome
```

**Body:**
```
If your archive is large and you mostly remember *what something was about* rather than the title, you might care about this.

I built Chauncy (https://chauncy.dev) — a Windows desktop app that:

1. Ingests PDFs, email, Office files, notes, URLs you already have
2. Searches by meaning on your machine
3. Surfaces related sources without you building backlinks
4. Optionally uses Anthropic/OpenAI/Ollama with *your* key — core search needs no cloud AI

No account, no telemetry, not an agent. One-time purchase ($99 for the first 100). Mac is on a waitlist.

Happy to answer technical questions (local embeddings, hybrid retrieval, what's out of scope). Looking for honest feedback on first-run friction especially.
```

---

## Block 2 — Show HN

**Title:**
```
Show HN: Chauncy – local semantic search over your PDFs, email, and notes
```

**URL:** `https://chauncy.dev`  
(or put URL in text if you prefer a text post)

**Text (if needed):**
```
I kept losing things I had already saved. Desktop search finds filenames. Note tools want a maintained graph. Chatbots want another upload.

Chauncy is a Windows desktop app (local-first):

- PDFs, Word, email, Markdown, HTML, URLs, notes
- Local embeddings + hybrid search
- Related material without manual linking
- Optional AI via your API key or Ollama; search works offline

No account, no telemetry, no autonomous agent. $99 early adopter (first 100).

https://chauncy.dev

Interested in feedback on first-run friction and whether "search by meaning" matches how you actually hunt for old material.
```

---

## Block 3 — LinkedIn / X

```
You know you saved it. You just can't find it.

Chauncy is local-first semantic search for PDFs, email, and notes you already keep. No account. No agent. Windows. $99 for the first 100.

https://chauncy.dev
```

---

## Block 4 — r/selfhosted or r/LocalLLaMA (another day)

**Title:**
```
Chauncy – local-first semantic search desktop app (Windows), optional Ollama
```

**Body:**
```
Windows desktop app for searching a personal document archive by meaning. Embeddings and hybrid search run locally. Optional synthesis via Ollama or your own API keys — nothing required for search.

- Ingest PDF, email, Office, markdown, URLs
- No account / no Chauncy cloud
- One-time license, not a subscription

https://chauncy.dev

Not multi-user, not a sync server. Built for a single machine library. Feedback welcome.
```

---

## Do not worry about right now

- Demo video (nice later)  
- Stripe receipt emails  
- Mac build  
- Perfect marketing site  
- Typing carefully in support tests (we've established the risk)

---

## If someone pays

1. They should land on https://chauncy.dev/thank-you  
2. If stuck: support@chauncy.dev → **Support** folder  
3. Refund within 14 days: Stripe → payment → Refund  

---

*You only need Step A today. Everything else can wait until you're less fried.*
