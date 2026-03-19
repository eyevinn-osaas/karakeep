# Karakeep - OSC Deployment

This fork contains OSC (Open Source Cloud) containerization artifacts for [karakeep-app/karakeep](https://github.com/karakeep-app/karakeep).

## Overview

Karakeep is a bookmark-everything app with AI tagging. It supports web pages, PDFs, images, and notes with automatic AI-powered tagging via OpenAI or Ollama.

## Dependencies

Karakeep requires:
- **Meilisearch** - for full-text search (provide `MEILI_ADDR` env var)

## Environment Variables

| Variable | Required | Description |
|---|---|---|
| `NEXTAUTH_SECRET` | Yes | Auth secret (auto-generated if not set, but ephemeral) |
| `MEILI_ADDR` | No | Meilisearch address (e.g., `http://meilisearch:7700`) |
| `MEILI_MASTER_KEY` | No | Meilisearch master key |
| `OPENAI_API_KEY` | No | OpenAI API key for AI tagging |
| `OLLAMA_BASE_URL` | No | Ollama base URL for local AI tagging |
| `DATA_DIR` | No | Data directory (default: `/data`) |
| `DISABLE_SIGNUPS` | No | Set to `true` to disable new signups |
| `SMTP_HOST` | No | SMTP host for email notifications |
| `SMTP_USER` | No | SMTP username |
| `SMTP_PASSWORD` | No | SMTP password |
| `SMTP_FROM` | No | From email address |

## OSC Platform

- Port: `$PORT` (default 8080)
- Public URL: `$OSC_HOSTNAME` mapped to `NEXTAUTH_URL`
- Persistent storage: `/data` volume required
- Service type: service (long-running HTTP server)

## Added Files

- `Dockerfile.osc` - OSC containerization based on official all-in-one image
- `osc-entrypoint.sh` - Entrypoint handling OSC platform conventions
- `README-OSC.md` - This file
- `CHANGELOG-OSC.md` - OSC artifact changelog
