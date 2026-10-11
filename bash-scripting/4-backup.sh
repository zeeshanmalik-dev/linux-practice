#!/bin/bash
# Backup script for text files
# Copies all .txt files from a source directory into a timestamped backup directory

read -p "Enter source directory: " src

# Check the source directory exists before doing anything (-d tests for a directory)
if [ ! -d "$src" ]; then
    echo "Error: '$src' is not a directory."
    exit 1
fi

# Build a backup folder name with the date and time in it
timestamp=$(date +%Y-%m-%d_%H-%M)
backup_dir="backup_$timestamp"

mkdir -p "$backup_dir"
echo "Backup directory created: $backup_dir"
echo "Copying .txt files..."

count=0
for file in "$src"/*.txt; do
    # If there are no .txt files, the pattern stays as literal text, so check the file is real
    if [ -f "$file" ]; then
        cp "$file" "$backup_dir/"
        count=$((count + 1))
    fi
done

echo "Backup complete! Files backed up: $count"
