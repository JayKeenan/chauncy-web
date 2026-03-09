# Chauncy App Summary

**Purpose:** Step 1 deliverable for CC-Chat — positioning, copy, and pricing input.
**Generated:** 2026-03-05
**Source:** Full codebase review of /mnt/d/Chauncy

---

## What Chauncy Is

A **semantic-first personal knowledge management (PKM) desktop app**. Users drop documents in and Chauncy automatically discovers connections between them using AI-powered vector embeddings — no manual linking, tagging, or folder hierarchies required.

**Core philosophy:** "The system discovers, proposes, and scaffolds. The human interprets, curates, and authors."

---

## The Problem It Solves

Traditional PKM tools (Obsidian, Notion, Roam) require users to:
- Manually link documents to each other
- Organize into hierarchies (folders, MOCs, structure notes)
- Synthesize and categorize upfront before content is useful

This doesn't scale. Most people accumulate documents but never build the links.

Chauncy replaces manual organization with **automatic semantic discovery** — drop a PDF in, and it instantly surfaces related emails, notes, and web clips you forgot you had.

---

## User-Facing Features

### Automatic Discovery (core — no user effort required)
- **Semantic search** — ask in plain English: "emails from Alice about budget last week"
- **Related documents** — open any document and see what's connected
- **Automatic backlinks** — discovered via cosine similarity, not manual linking
- **Content deduplication** — won't import the same document twice

### Document Ingestion (7 formats + manual capture)
- PDF (text extraction)
- Email (RFC822, IMAP mailbox sync, forwarded emails)
- Markdown
- Web URLs (via clipper)
- PowerPoint & Word
- Plain text & HTML
- **Typed notes** — quick-capture dialog with title, source, and body
- **Voice notes** — via browser Speech-to-Text (Chrome recommended); Whisper as fallback only

### Optional Enrichment (user chooses when it's valuable)
- **Annotations** — attach personal notes to any document
- **Folder watching** — auto-import from one designated folder
- **IMAP sync** — poll one email account for new messages

### Interface
- **Chat-like conversational search** — single text input, no filters or dropdowns
- **Document viewer** — full-text display with annotations sidebar
- **Settings panel** — configure database, LLM, ingestion sources

---

## Privacy & Connectivity Model

**Search and storage are fully local.** Documents, embeddings, and the database live on the user's machine — no account, no telemetry, no cloud sync.

- **Search works offline** — vector + keyword search runs entirely locally
- **LLM analysis requires an API key** — user selects their own provider (OpenAI, Anthropic, Groq, or custom endpoint) and provides an API key
- **When LLM is used**, relevant document excerpts are sent to the chosen provider — governed by that provider's privacy policy
- **LLM is optional** — all core PKM functionality (ingest, search, related documents) works without it
- Users who want fully offline analysis can point the custom base URL at a local LLM (e.g. LM Studio)
- Documentation will guide users on privacy implications of each provider choice

---

## Platform Targets

| Platform | Status | Distribution |
|---|---|---|
| **Windows** | Primary | Inno Setup installer (.exe) + portable bundle |
| **Linux** | Supported | AppImage |
| **macOS** | Framework ready | Bundle (not yet tested) |

---

## Technical Architecture

```
User (system browser)
    ↕ HTTP REST (62 endpoints)
FastAPI backend (Python 3.11+)
    ↕                    ↕
SQLite + sqlite-vec  User's LLM provider
+ FTS5               (OpenAI / Anthropic / Groq / custom)
```

- **Frontend:** SvelteKit 5, TypeScript, Vite
- **Backend:** Python, FastAPI, sentence-transformers, PyMuPDF, spaCy
- **Database:** SQLite with sqlite-vec (384-dimensional vectors) + FTS5 full-text search
- **Search:** Hybrid — 85% vector similarity + 15% BM25 keyword matching
- **Bundling:** PyInstaller (backend) + static SvelteKit build (no external database required)

---

## Build & Distribution State

### What's ready
- Windows installer (Inno Setup) — single .exe, ~400-500 MB
- Portable bundle (all platforms) — run from any directory
- Embedded SQLite database — no separate database install needed
- Automatic database initialization on first run
- Linux AppImage build script
- Development launchers (`dev.sh` / `dev.bat`)

### What's not ready
- **Auto-update** — not implemented
- **Code signing** — not configured (users will see OS warnings)
- **macOS** — build framework exists but untested

---

## Current Completion State

### Solid and working
- All 7 ingestion formats
- Semantic search with sub-200ms vector queries
- Conversational natural language query parsing
- Automatic related documents and backlinks
- Annotations
- Full build pipeline producing installable artifacts
- 37 backend tests passing, 31 frontend tests passing

### In progress
- `/documents` endpoint performance (currently 4.3s, target <100ms — N+1 query fix)
- Desktop E2E test coverage (WebDriverIO framework ready)

### Not in scope (by design)
- Manual linking between documents
- Hierarchical organization (folders, MOCs)
- Multi-user / sharing
- Mobile / PWA
- Cloud sync

---

## Differentiators for Positioning

1. **Semantic-first** — automatic discovery vs. manual linking
2. **Zero friction** — drop documents in, instantly searchable
3. **Conversational** — ask naturally, no query syntax to learn
4. **Multi-format** — PDFs, emails, typed notes, voice, web, Office docs, markdown
5. **Optional enrichment** — annotations and workflows when you want them, not mandatory

---

## Decisions Made (Steps 2 & 3)

- **Pricing:** $129 one-time, $89 launch discount for first 100 licenses, 14-day money-back guarantee
- **Audience:** Researchers, writers, consultants, analysts, students
- **Not for:** Regulated environments (HIPAA, legal privilege, federal grant) — compliance carve-out language required
- **Platforms at launch:** Windows + Linux; macOS listed as "coming soon" with waitlist
- **Positioning:** Against Obsidian (free, manual linking) and Notion (SaaS, cloud)

## Remaining Open Questions

- License key delivery mechanism?
- Stripe Payment Links vs. embedded checkout?
- macOS waitlist mechanism — simple email form or third-party?
- macOS testing timeline — target date before or after launch?
