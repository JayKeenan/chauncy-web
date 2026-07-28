# Chauncy App Summary

**Last Updated:** 2026-03-16
**Status:** Pre-launch — frontend rewrite complete, testing in progress

---

## What Chauncy Is

A **semantic-first personal knowledge management (PKM) desktop app**. Users bring their documents — PDFs, emails, notes, web pages, Office files — and Chauncy automatically discovers connections between them using AI-powered vector embeddings. No manual linking, tagging, or folder hierarchies required.

**Core philosophy:** "The system discovers, proposes, and scaffolds. The human interprets, curates, and authors."

---

## The Problem It Solves

Traditional PKM tools (Obsidian, Notion, Roam) require users to manually link documents, organize into hierarchies, and categorize content upfront before it becomes useful. This doesn't scale. Most people accumulate documents but never build the connections.

Chauncy replaces manual organization with **automatic semantic discovery** — drop a PDF in, and it instantly surfaces related emails, notes, and web clips you forgot you had.

---

## User-Facing Features

### Document Ingestion

Chauncy accepts the following formats:

| Format | Notes |
|---|---|
| PDF | Text extraction; scanned (image-only) PDFs are flagged as unsearchable |
| Word (.docx) | Full text extraction |
| PowerPoint (.pptx) | Full text extraction per slide |
| Email (.eml) | RFC822, forwarded emails, attachment extraction |
| Email (.mbox) | Mailbox export format (Betterbird, Thunderbird) |
| Markdown (.md) | Plain text extraction with formatting stripped |
| HTML | Body text extraction, tags stripped |
| Plain text (.txt) | Pass-through |
| Web URL | Fetches page, extracts body text |
| Typed note | Quick-capture dialog — title, body, optional source |

**Ingestion methods:**
- Drag and drop files onto the ingest page
- File picker (single or multiple files)
- Folder scan — select a folder and Chauncy recursively walks subdirectories and ingests all supported files
- Watch folder — designate a folder; Chauncy polls it every 2 minutes and auto-ingests new files
- IMAP sync — connect an email account; Chauncy polls for new unread messages and ingests them
- Typed note via quick-capture dialog
- Voice note — speak into the microphone; Web Speech API transcribes live and the transcript is saved as a note

**Deduplication:** Chauncy will not ingest the same document twice. Each file is fingerprinted on ingest and duplicates are silently skipped.

---

### Search

Chauncy uses **hybrid search** — combining vector similarity (semantic) and full-text keyword matching. The balance between the two is adaptive, determined automatically by the type of query.

**How to search:**
- Type in the chat input and press Enter
- Queries are natural language — no syntax to learn
- Results show document title, a relevant excerpt, and a relevance score
- Click any result to open the full document

**Query types handled automatically:**

| Query type | Example | Behavior |
|---|---|---|
| Natural language | "emails about the budget from last quarter" | Semantic-weighted |
| Proper name | "Alice Johnson" | Balanced |
| Technical term | "LanceDB schema migration" | Keyword-weighted |
| Pseudo-tag | `~subscriptions` | Exact match only |
| Metadata | "PDFs from March" | Metadata-weighted |

**Document scoping:** After finding a relevant document, the user can scope follow-up queries to that document only.

---

### LLM Answer Mode

In addition to search results, Chauncy can generate an answer using the user's chosen LLM provider.

- User enables answer mode in the chat interface
- Chauncy retrieves the most relevant document chunks and sends them to the LLM with a structured prompt
- The LLM response streams token-by-token into the interface
- Sources used to generate the answer are displayed alongside the response
- **LLM is fully optional** — all core PKM features (ingest, search, related documents) work without it

**Supported LLM providers:**
- Anthropic (default — claude-sonnet-4-6)
- OpenAI
- Groq
- Custom endpoint (compatible with OpenAI API format — supports local LLMs via LM Studio, Ollama, etc.)

User supplies their own API key. No Chauncy account or subscription required for LLM features.

---

### Document Viewer

Clicking any search result opens a full document viewer:

- Full extracted text display
- Annotations panel — attach personal notes to any document
- Related documents — documents semantically similar to the current one
- Original file link

---

### Annotations

Users can attach notes to any document:

- Create, edit, and delete annotations on any ingested document
- Annotations are indexed and searchable alongside document content
- Annotation embedding uses parent-document context so short annotations ("important", "follow up") land correctly in search results

---

### Library

The library view shows all ingested documents:

- List and grid view
- Search and filter by source type, date, status
- Sort by date, title, word count
- Pagination
- Click any document to open the viewer

---

### Settings

- **LLM configuration** — provider, model, API key, base URL, temperature
- **Watch folder** — path, archive folder, batch limit, enable/disable
- **IMAP sync** — host, port, SSL, credentials, mailbox, batch limit, delete-after-ingest option
- **Backup** — create, list, restore, and delete backups of the database; configurable backup directory

---

## Privacy and Connectivity

**All documents, embeddings, and search are fully local.** Nothing leaves the user's machine unless they choose to use an LLM provider.

- No Chauncy account required
- No telemetry
- No cloud sync
- Search works completely offline
- When LLM answer mode is used, relevant document excerpts are sent to the chosen provider — governed by that provider's privacy policy
- Users who want fully offline LLM analysis can point the custom endpoint at a local model

**Chauncy is not designed for regulated environments** (HIPAA, legal privilege, federal grant compliance). This is stated explicitly in product documentation.

---

## Platform Support

| Platform | Status | Distribution |
|---|---|---|
| Linux | Supported at launch | AppImage + .deb + .rpm |
| Windows | Supported at launch | Standalone .exe (MSI installer post-launch) |
| macOS | Coming soon | Waitlist on pricing page |

---

## Technical Architecture

```
SvelteKit frontend (webview)
         ↕
   Tauri invoke() commands
         ↕
    Rust backend
         ↕
       LanceDB
(single embedded file-based store)
  vectors · full text · metadata
  annotations · settings · dedup
         ↕
   fastembed-rs
 BGE-small-en-v1.5 (384-dim)
  local ONNX inference
```

- **Desktop framework:** Tauri 2.x (Rust)
- **Frontend:** SvelteKit 5, TypeScript
- **Data store:** LanceDB — single embedded store, no server process
- **Embeddings:** fastembed BGE-small-en-v1.5 (384-dimensional vectors, local ONNX inference)
- **PDF parsing:** pdfium-render with bundled libpdfium
- **Search:** Hybrid vector + BM25, adaptive weighting by query type
- **Build/distribution:** Tauri bundler (cross-compiles Linux → Windows natively)

**First launch:** The BGE embedding model (~128MB) downloads from HuggingFace Hub on first launch and caches locally. Subsequent launches load from cache.

---

## Explicitly Out of Scope

These are not features and will not be added:

- Manual document linking
- Hierarchical organization (folders, MOCs, structure notes)
- Multi-user or sharing
- Mobile or PWA
- Cloud sync
- OCR for scanned PDFs
- Compliance features (HIPAA, legal privilege, federal grant)
- Auto-update (post-launch)

---

## Pricing and Distribution

- **Price:** $149 one-time purchase / $99 launch discount for first 100 licenses
- **Guarantee:** 14-day money-back
- **Payment:** Stripe Payment Links
- **Download delivery:** GitHub Releases on `JayKeenan/chauncy-web` (v0.1.0), linked from `/thank-you`
- **SHA-256:** `FCA18F6E356DE7AA46CDAE650BFA80EF64D85CCB7F09FDB8A0761DD05DA6F70A`
- **No license key** at launch (trust + 14-day refund; download page is post-purchase destination)
- **No SaaS** — one-time purchase, no subscription

---

## Target Audience

Researchers, writers, consultants, analysts, and students who accumulate large document collections and want to find connections without manual organization overhead.

**Not for:** Users in regulated environments requiring data compliance guarantees.
