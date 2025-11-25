#!/bin/bash
set -euo pipefail
echo "🔍 Linting with Trunk..."
trunk check --ci || true
echo "✅ Linting completed"