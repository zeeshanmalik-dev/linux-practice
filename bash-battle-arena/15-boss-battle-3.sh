#!/bin/bash

backup_arena() {
    BACKUP_DIR="Backups_Final"
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    mkdir -p "$BACKUP_DIR"
    cp -r Arena "$BACKUP_DIR/backup_$TIMESTAMP"
    echo "Backup created: backup_$TIMESTAMP"

    COUNT=$(ls "$BACKUP_DIR" | wc -l)
    if [ "$COUNT" -gt 3 ]; then
        OLDEST=$(ls -t "$BACKUP_DIR" | tail -1)
        rm -rf "$BACKUP_DIR/$OLDEST"
        echo "Removed oldest backup: $OLDEST"
    fi
}

parse_config() {
    while IFS='=' read -r key value; do
        echo "Key: $key | Value: $value"
    done < settings.conf
}

while true; do
    echo ""
    echo "=== Final System Menu ==="
    echo "1) Check disk space"
    echo "2) Show system uptime"
    echo "3) Backup Arena (keep last 3)"
    echo "4) Parse settings.conf"
    echo "5) Exit"
    read -p "Choose an option: " CHOICE

    case $CHOICE in
        1) df -h ;;
        2) uptime ;;
        3) backup_arena ;;
        4) parse_config ;;
        5) echo "Exiting."; break ;;
        *) echo "Invalid option, try again." ;;
    esac
done
