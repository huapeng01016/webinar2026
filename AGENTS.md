# Repository Guidelines

## Project Structure & Module Organization

This repository supports a public June 2026 Stata programming webinar:

- `README.md` gives the project title and short description.
- `LICENSE` contains the repository license.
- `AGENTS.md` documents contributor and agent expectations.
- `data/` stores small, public sample datasets.
- `src/` stores Stata `.do` files, helper scripts, and examples.
- `docs/` stores notes, slide decks, and supporting documentation.

As the project grows, add `tests/` for automated tests and `assets/` for images or presentation media if needed. Do not commit generated output, large raw datasets, or local editor files.

## Build, Test, and Development Commands

No project-specific build or test runner exists yet. Use these baseline commands before submitting changes:

- `git status --short` checks what files are changed.
- `git diff --check` detects trailing whitespace and common patch formatting issues.
- `git log --oneline -5` reviews recent commit style.

When tooling is added, document it here and in `README.md`. Prefer reproducible commands such as `npm test`, `make test`, `pytest`, or project-specific Stata batch commands.

## Coding Style & Naming Conventions

Keep files plain text where possible and use UTF-8. Use descriptive, lowercase file names with hyphens or underscores, for example `webinar-outline.md` or `clean_sample_data.do`. Match the language style: four spaces for Python, two spaces for YAML/JSON, and clear section comments in Stata `.do` files. Avoid unrelated reformatting.

## Testing Guidelines

Add tests alongside new code whenever practical. Place automated tests under `tests/` and name them after the behavior under test, such as `test_data_cleaning.py` or `test_exports.do`. For Stata workflows, include small sample inputs and expected outputs so results can be reproduced without private data. Note manual verification steps in the pull request when automation is unavailable.

## Commit & Pull Request Guidelines

The current history only contains `Initial commit`, so use clear, imperative commit messages going forward, for example `Add webinar outline` or `Document data cleaning workflow`. Keep each commit focused on one logical change.

Pull requests should include a short summary, the reason for the change, verification performed, and any follow-up work. Link related issues when available. Include screenshots or exported artifacts for presentation, chart, or visual changes.

## Security & Configuration Tips

Do not commit secrets, private attendee data, licensed datasets, or machine-specific paths. Use ignored local configuration files for credentials and document required environment variables or external data sources in `README.md`.
