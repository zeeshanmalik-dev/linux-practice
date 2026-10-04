#!/bin/bash
SOURCE_DIR="$1"
BACKUP_DIR="Backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p "$BACKUP_DIR"
cp -r "$SOURCE_DIR" "$BACKUP_DIR/backup_$TIMESTAMP"

echo "Backup created: backup_$TIMESTAMP"

BACKUP_COUNT=$(ls "$BACKUP_DIR" | wc -l)

if [ "$BACKUP_COUNT" -gt 5 ]; then
    OLDEST=$(ls -t "$BACKUP_DIR" | tail -1)
    rm -rf "$BACKUP_DIR/$OLDEST"
    echo "Removed oldest backup: $OLDEST"
fi

echo "Current backups:"
ls "$BACKUP_DIR"
