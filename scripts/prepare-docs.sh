#!/usr/bin/env bash
# Copies the Obsidian vault into build/docs as a MkDocs docs_dir:
#   - drops Obsidian/editor metadata and empty stub notes
#   - README.md becomes the site home page
#   - "Folder/Folder.md" becomes "Folder/index.md" (section landing page)
#   - notes with no H1 get one derived from the file name, so page titles,
#     <title> tags and search results are meaningful
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
out="$root/build/docs"

rm -rf "$root/build"
mkdir -p "$out"

rsync -a \
  --exclude '.git/' --exclude '.github/' --exclude '.obsidian/' \
  --exclude '.makemd/' --exclude '.space/' --exclude '.trash/' \
  --exclude 'build/' --exclude 'scripts/' --exclude 'site/' \
  --exclude 'Vault.md' --exclude 'mkdocs.yml' --exclude 'requirements.txt' \
  "$root/" "$out/"

# Empty stub notes would show up as blank pages in the nav.
find "$out" -name '*.md' -size -10c -delete

# The README's table of contents duplicates the site nav, so the site gets a
# purpose-built landing page instead.
rm -f "$out/README.md"
cp "$root/scripts/home.md" "$out/index.md"

# Section landing pages: "Design Patterns/Design Patterns.md" -> ".../index.md"
find "$out" -mindepth 2 -name '*.md' -print0 | while IFS= read -r -d '' f; do
  dir="$(dirname "$f")"
  if [[ "$(basename "$f" .md)" == "$(basename "$dir")" ]]; then
    mv "$f" "$dir/index.md"
  fi
done

# Give every note an H1 and a meta description, so page titles and search
# snippets are per-page instead of falling back to the site defaults.
python3 - "$out" <<'PY'
import json, pathlib, re, sys

def plain(line):
    line = re.sub(r'`([^`]*)`', r'\1', line)
    line = re.sub(r'\[([^]]*)\]\([^)]*\)', r'\1', line)
    return re.sub(r'[*_>#]', '', line).strip()

for path in sorted(pathlib.Path(sys.argv[1]).rglob('*.md')):
    text = path.read_text(encoding='utf-8')
    if text.startswith('---'):  # already has front matter (the home page)
        continue
    name = path.parent.name if path.stem == 'index' else path.stem

    body = text if re.search(r'^# ', text, re.M) else f'# {name}\n\n{text}'

    summary = next(
        (plain(l) for l in body.splitlines()
         if l.strip() and not l.startswith(('#', '-', '*', '|', '```', '!['))),
        '',
    )
    if len(summary) > 160:
        summary = summary[:157].rsplit(' ', 1)[0] + '…'
    description = f'{name} — {summary}' if summary else f'{name} in software engineering.'

    path.write_text(f'---\ndescription: {json.dumps(description)}\n---\n\n{body}', encoding='utf-8')
PY

printf 'User-agent: *\nAllow: /\nSitemap: https://maniebra.github.io/software-engineering-docs/sitemap.xml\n' > "$out/robots.txt"

echo "prepared $(find "$out" -name '*.md' | wc -l) pages in $out"
