#!/usr/bin/env bash

# set -euo pipefail

# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
# PYTHON_BIN="${PYTHON_BIN:-python3}"
# PIP_COMMON_ARGS=(--disable-pip-version-check --break-system-packages)

# if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
#   echo "Error: '$PYTHON_BIN' is not available in PATH." >&2
#   exit 1
# fi

# PYTHON_EXE="$($PYTHON_BIN -c 'import sys; print(sys.executable)')"

# echo "Using Python environment: $PYTHON_EXE"
# echo "Repository root: $REPO_ROOT"

# # Upgrade the current workspace interpreter's packaging helpers first.
# "$PYTHON_BIN" -m pip install "${PIP_COMMON_ARGS[@]}" --upgrade pip setuptools wheel

# # Install the repo runtime requirements in the active workspace interpreter.
# "$PYTHON_BIN" -m pip install "${PIP_COMMON_ARGS[@]}" -r "$REPO_ROOT/requirements.txt"

# # Install the missing Qt resource-compiler support that the QGIS 4 plugin
# # compile flow expects. The PySide6 package provides the `pyside6-rcc` binary
# # and the Qt6 resource compiler support needed by modern QGIS 4 tooling.
# "$PYTHON_BIN" -m pip install "${PIP_COMMON_ARGS[@]}" \
#   "PySide6>=6.8,<7"

# # Keep the local workspace test/development tooling present.
# "$PYTHON_BIN" -m pip install "${PIP_COMMON_ARGS[@]}" "pytest>=8.4,<9"

# echo "Compile prerequisites installed for active interpreter: $PYTHON_EXE"


QGIS_PYTHON="/Applications/QGIS-final-4_2_0.app/Contents/MacOS/python"

# $QGIS_PYTHON -m pip install --upgrade pip
# $QGIS_PYTHON -m pip install --upgrade pb_tool
# $QGIS_PYTHON -m pip install --upgrade pyside6

# add to .bash_profile or .zshrc
export PATH="/Applications/QGIS-final-4_2_0.app/Contents/Frameworks/bin:$PATH"

# restart terminal and run

conda activate qgis4_dev
cd /Users/hughsaalmans/git/minus34/bigquerylayers
pb_tool compile

