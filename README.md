# China RSEI Paper Draft

This repository stores shareable PDF drafts for the China 30 m RSEI paper.

Current combined PDF:

- `Long-term_30m_ecological_quality_dynamics in_China_revealed_by_a_cross-sensor-consistent_annual_RSEI_record_Jun29.pdf`

After the first script run, the latest shareable files will be:

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
