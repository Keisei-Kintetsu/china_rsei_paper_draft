# China RSEI Paper Draft

This repository stores shareable PDF drafts for the China 30 m RSEI paper.

Current shareable files:

- `latest/main.pdf`
- `latest/supplementary.pdf`

Repeatable workflow for a new draft folder:

```bash
cd /Users/liangerzheng/china_rsei_paper_draft
sh scripts/publish_draft.sh "/Users/liangerzheng/Documents/LST_downscaling/jun_paper_drafts/20260624_1221"
```

What the script does:

1. Reads `main.pdf` and `supplementary.pdf` from the folder you give it.
2. Updates `latest/main.pdf` and `latest/supplementary.pdf`.
3. Archives the same files in `versions/<folder_name>/`.
4. Runs `git add`, `git commit`, and `git push` automatically.

Current archived version:

- `versions/20260624_1221/main.pdf`
- `versions/20260624_1221/supplementary.pdf`
