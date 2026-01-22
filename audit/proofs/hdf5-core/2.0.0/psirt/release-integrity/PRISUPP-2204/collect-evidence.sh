#!/usr/bin/env bash
# collect-evidence.sh — minimal evidence capture for PRISUPP-2204-style checksum mismatch
set -euo pipefail

RELEASE_VERSION="${RELEASE_VERSION:-2.0.0}"
CANONICAL_URL="${CANONICAL_URL:-}"
GITHUB_URL="${GITHUB_URL:-}"
CANONICAL_FILE="${CANONICAL_FILE:-canonical.tar.gz}"
GITHUB_FILE="${GITHUB_FILE:-github.tar.gz}"

mkdir -p artifacts/{canonical,github,logs,diffs}

echo "[*] Downloading artifacts..."
curl -L "$CANONICAL_URL" -o "artifacts/canonical/${CANONICAL_FILE}"
curl -L "$GITHUB_URL"    -o "artifacts/github/${GITHUB_FILE}"

echo "[*] Checksums..."
sha256sum "artifacts/canonical/${CANONICAL_FILE}" "artifacts/github/${GITHUB_FILE}" | tee "artifacts/logs/sha256sum.txt"
sha512sum "artifacts/canonical/${CANONICAL_FILE}" "artifacts/github/${GITHUB_FILE}" | tee "artifacts/logs/sha512sum.txt"

echo "[*] Unpack..."
rm -rf work && mkdir -p work/{canonical,github}
tar -xf "artifacts/canonical/${CANONICAL_FILE}" -C work/canonical --strip-components=1
tar -xf "artifacts/github/${GITHUB_FILE}"       -C work/github   --strip-components=1

echo "[*] Manifests..."
for d in canonical github; do
  ( cd work/$d &&     find . -type f -print0 | sort -z | xargs -0 sha256sum > ../../artifacts/diffs/${d}.file-sha256.txt &&     find . -printf '%y %m %u %g %s %p\n' | LC_ALL=C sort > ../../artifacts/diffs/${d}.stat.txt )
done

echo "[*] Diffs (non-fatal)..."
diff -u artifacts/diffs/canonical.file-sha256.txt artifacts/diffs/github.file-sha256.txt | tee artifacts/diffs/filehash.diff || true
diff -ruN work/canonical work/github | tee artifacts/diffs/tree.diff || true

echo "[*] Done. Fill EVIDENCE-TABLE.md and SAFE-OSE-evidence.md with the results."
