#!/bin/bash
# Simple wrapper script to run the integration

# Activate virtual environment if it exists
if [ -d "venv" ]; then
    source venv/bin/activate
fi

# If no arguments, show the unified menu
# Otherwise pass all arguments to main.py
if [ $# -eq 0 ]; then
    python3 main.py
else
    python3 main.py "$@"
fi
