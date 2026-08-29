# taejinpark.com

Personal website of Taejin Park, served by GitHub Pages at **https://taejinpark.com** (custom domain set in `CNAME`).

## Structure

```
├── index.html                  The site — a single page (design-canvas format, runs on assets/js/support.js)
├── .image-slots.state.json     Saved images for the page's image slots (hero photo, chart slides)
├── .nojekyll                   Keeps GitHub Pages from dropping the dotfile above
├── CNAME                       Custom domain (taejinpark.com)
├── assets/
│   ├── js/                     Runtime scripts for the page (support.js, image-slot.js) — don't edit
│   └── uploads/                Source files: CV (.docx), drawings, etc.
├── viz/                        Interactive visualisations embedded from the Charts section
│   └── viz-demo.html
└── design/                     Design explorations (reference only, not linked from the site)
```

## Where to edit content

All content lives in `index.html`, inside the `<script type="text/x-dc">` block near the bottom:

- **Research papers** — the `papers` array: one `{ year, title, authors, venue, href }` object per paper, newest first. They paginate five per page automatically.
- **Charts / visualisations** — the `posts` array: one entry per slide (`title`, `desc`, `meta`, optional `embed` pointing at an interactive page in `viz/`). The image for each slide is set via the page itself (image slots) and stored in `.image-slots.state.json`. Each slide is linkable as `taejinpark.com/#fig-01` etc. via its `slug`.
- **Repositories** — the `repos` array (`name`, `desc`, `href`).
- **CV** — `cv` (the short list on the page) and `cvFull` / `education` (the "View full CV" modal).
- **Intro text / footer links** — directly in the HTML body of `index.html`.

## Publishing

Commit and push to `main`; GitHub Pages redeploys automatically:

```
git add -A
git commit -m "Update content"
git push
```

## Notes

- Preview locally with a web server (e.g. `python -m http.server`), not by double-clicking the file — the image slots load their state via `fetch`, which browsers block on `file://`.
- The site has a light/dark toggle (persisted per visitor in `localStorage`).
