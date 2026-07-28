#!/usr/bin/env bash
# Publish Chauncy Windows installer as a GitHub Release on jaykeenan/chauncy-web.
# Prerequisites: gh auth login; release-assets/Chauncy_0.1.0_x64-setup.exe present
set -euo pipefail

REPO="jaykeenan/chauncy-web"
TAG="v0.1.0"
TITLE="Chauncy 0.1.0 — Windows installer"
ASSET_DIR="$(cd "$(dirname "$0")/.." && pwd)/release-assets"
EXE="${ASSET_DIR}/Chauncy_0.1.0_x64-setup.exe"
SHA_FILE="${ASSET_DIR}/Chauncy_0.1.0_x64-setup.exe.sha256"

if ! gh auth status >/dev/null 2>&1; then
  echo "ERROR: Not logged into GitHub. Run: gh auth login"
  exit 1
fi

if [[ ! -f "$EXE" ]]; then
  echo "ERROR: Missing installer at $EXE"
  echo "Extract from Chauncy_0.1.0_x64-setup.zip into release-assets/"
  exit 1
fi

if [[ ! -f "$SHA_FILE" ]]; then
  sha256sum "$EXE" | tee "$SHA_FILE"
fi

SHA=$(awk '{print toupper($1)}' "$SHA_FILE")
SIZE=$(du -h "$EXE" | awk '{print $1}')

NOTES=$(cat <<EOF
## Chauncy for Windows — ${TAG}

One-time purchase desktop app. Local-first semantic search over your documents.

### Download

| File | Platform | Size |
|------|----------|------|
| \`Chauncy_0.1.0_x64-setup.exe\` | Windows 10/11 x64 | ${SIZE} |

**SHA-256:** \`${SHA}\`

### After install

1. Run the installer
2. Launch Chauncy
3. Add a folder of documents
4. Ask a question in plain English

### Support

Email: support@chauncy.dev

Purchase and downloads: https://chauncy.dev/pricing
EOF
)

if gh release view "$TAG" --repo "$REPO" >/dev/null 2>&1; then
  echo "Release $TAG already exists — uploading asset (clobber if present)..."
  gh release upload "$TAG" "$EXE" --repo "$REPO" --clobber
else
  echo "Creating release $TAG..."
  gh release create "$TAG" "$EXE" \
    --repo "$REPO" \
    --title "$TITLE" \
    --notes "$NOTES" \
    --latest
fi

echo ""
echo "Published. Download URL:"
echo "https://github.com/${REPO}/releases/download/${TAG}/Chauncy_0.1.0_x64-setup.exe"
echo "SHA-256: ${SHA}"
