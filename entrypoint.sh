#!/bin/bash
set -eo pipefail

[ -n "${TZ:-}" ] && [ -f "/usr/share/zoneinfo/$TZ" ] && {
    ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime
    echo "$TZ" > /etc/timezone
}

SCRIPT="${1:-${PY_SCRIPT:-./startup_script.py}}"

if [ -f "$SCRIPT" ]; then
    chmod +x "$SCRIPT" 2>/dev/null || :
else
    echo "Error: Python script '$SCRIPT' not found!" >&2
    exit 1
fi

exec python3 -u "$SCRIPT"