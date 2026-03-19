#!/bin/bash
set -eo pipefail

PORT=${PORT:-8080}

# Karakeep internally uses port 3000 by default; we map to OSC PORT
# The app reads PORT env var
export PORT="${PORT}"
export HOSTNAME="0.0.0.0"

# Map OSC_HOSTNAME to NEXTAUTH_URL
if [ -n "$OSC_HOSTNAME" ]; then
    export NEXTAUTH_URL="${NEXTAUTH_URL:-https://${OSC_HOSTNAME}}"
    export API_URL="${API_URL:-https://${OSC_HOSTNAME}}"
fi

# Persistent data directory
export DATA_DIR="${DATA_DIR:-/data}"
mkdir -p "${DATA_DIR}"

# Generate NEXTAUTH_SECRET if not provided
if [ -z "$NEXTAUTH_SECRET" ]; then
    echo "WARNING: NEXTAUTH_SECRET is not set. Generating ephemeral secret (will invalidate sessions on restart)."
    export NEXTAUTH_SECRET="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"
fi

# s6-overlay init is the original entrypoint
exec /init
