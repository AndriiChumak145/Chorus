#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Error: missing env file at $ENV_FILE" >&2
  exit 1
fi

set -a
source "$ENV_FILE"
set +a

if [[ -z "${INPUT_ROOT:-}" || -z "${OUTPUT_DIR:-}" ]]; then
  echo "Error: INPUT_ROOT and OUTPUT_DIR must be set in $ENV_FILE" >&2
  exit 1
fi

python -m tools.mini_viewer \
  --input-root "$INPUT_ROOT" \
  --output-dir "$OUTPUT_DIR" \
  --saliency-enabled