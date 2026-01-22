# Evidence table — PRISUPP-2204 (HDF5 <RELEASE_VERSION>)

> Store this file alongside the captured artifacts. Keep paths stable.

## Artifact register

| Item | Source | URL / locator | Local path | Size (bytes) | SHA-256 | SHA-512 | Notes |
|---|---|---|---|---:|---|---|---|
| Canonical source tarball | HDF Group downloads | `<CANONICAL_TARBALL_URL>` | `artifacts/canonical/<CANONICAL_FILENAME>` | `<BYTES>` | `<SHA256_CANONICAL>` | `<SHA512_CANONICAL>` | `<NOTES>` |
| Canonical checksum file(s) | HDF Group downloads | `<CHECKSUM_URLS>` | `artifacts/canonical/` | `<BYTES>` | `<SHA256>` | `<SHA512>` | `<NOTES>` |
| Canonical signature file(s) | HDF Group downloads | `<SIG_URLS>` | `artifacts/canonical/` | `<BYTES>` | `<SHA256>` | `<SHA512>` | `<NOTES>` |
| GitHub auto-archive | GitHub tag archive | `<GITHUB_ARCHIVE_URL>` | `artifacts/github/<GITHUB_FILENAME>` | `<BYTES>` | `<SHA256_GITHUB>` | `<SHA512_GITHUB>` | `<NOTES>` |

## Control → evidence mapping

> Replace the control IDs below with HDF5-SHINES control IDs if they differ.

| Control | Requirement / intent | Evidence captured | Where (path / link) | Result | Notes |
|---|---|---|---|---|---|
| SO-SCM-01 | Provenance of release tags (tag → commit) | `git show --pretty=raw`, `git rev-parse` | `artifacts/logs/git-provenance.txt` | ☐ pass ☐ fail ☐ n/a |  |
| SO-SCM-02 | Tag/commit authenticity (signature verification) | `git verify-tag`, `git verify-commit`, key fingerprints | `artifacts/logs/git-verify.txt` | ☐ pass ☐ fail ☐ n/a |  |
| SO-REL-04 | Checksum publication & verification | `sha256sum.txt`, `sha512sum.txt` | `artifacts/logs/sha256sum.txt`, `artifacts/logs/sha512sum.txt` | ☐ pass ☐ fail |  |
| SO-REL-03 | Reproducible source packaging | Deterministic repack test, normalized tarball checksums | `artifacts/logs/repacked.sha256.txt` | ☐ pass ☐ fail ☐ n/a |  |
| SO-REL-02 | Release artifact completeness | File manifests, tree diff | `artifacts/diffs/*.txt`, `artifacts/diffs/tree.diff` | ☐ pass ☐ fail |  |
| SO-VUL-01 | Integrity finding triage + decision record | This ticket’s timeline + decision log | `SAFE-OSE-evidence.md` | ☐ complete ☐ incomplete |  |
| SO-GOV-02 | Public communication of security-relevant notes | Release notes / advisory link | `<URL/COMMIT>` | ☐ published ☐ not needed |  |

## Key diffs summary

- File-hash manifest diff: `artifacts/diffs/filehash.diff`
  - Summary: `<ONE-LINE_SUMMARY>`
- Tree diff: `artifacts/diffs/tree.diff`
  - Summary: `<ONE-LINE_SUMMARY>`
- Repack reproducibility: `artifacts/logs/repacked.sha256.txt`
  - Summary: `<ONE-LINE_SUMMARY>`
