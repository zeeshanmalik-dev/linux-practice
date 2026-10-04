#!/bin/bash
DIR="$1"
THRESHOLD="$2"

USAGE=$(du -sh "$DIR" 2>/dev/null | awk '{print $1}')
USAGE_PERCENT=$(df -h "$DIR" | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk usage for $DIR: $USAGE"
echo "Filesystem usage: $USAGE_PERCENT%"

if [ "$USAGE_PERCENT" -gt "$THRESHOLD" ]; then
    echo "ALERT: Usage exceeds threshold of $THRESHOLD%"
else
    echo "OK: Usage is within threshold"
fi
