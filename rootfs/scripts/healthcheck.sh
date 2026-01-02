#!/command/with-contenv bash
# shellcheck shell=bash

# Exit abnormally for any error
set -eo pipefail

# Set default exit code
EXITCODE=0

# Make sure web server listening on port 80
if [ "$(ss -Hltn sport 80 | wc -l)" -ge 1 ]; then
    echo "[$(date)][HEALTHY] Planefence listening on port 80, OK."
else
    echo "[$(date)][UNHEALTHY] Planefence not listening on port 80, NOT OK."
    EXITCODE=1
fi

# Exit with determined exit status
exit "$EXITCODE"

