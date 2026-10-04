#!/bin/bash
WATCH_DIR="Arena"
LOG_FILE="changes.log"

echo "Monitoring $WATCH_DIR for changes. Press Ctrl+C to stop."

PREV_STATE=$(ls -la "$WATCH_DIR")

while true; do
    sleep 2
    CURRENT_STATE=$(ls -la "$WATCH_DIR")
    if [ "$CURRENT_STATE" != "$PREV_STATE" ]; then
        echo "$(date): Change detected in $WATCH_DIR" >> "$LOG_FILE"
        PREV_STATE="$CURRENT_STATE"
    fi
done
