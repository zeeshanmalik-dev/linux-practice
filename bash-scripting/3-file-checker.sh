#!/bin/bash
# File checker with permissions
# Asks for a filename, checks it exists, then reports its permissions

read -p "Enter filename to check: " filename

# -e is true if the file exists (any type)
if [ ! -e "$filename" ]; then
    echo "File '$filename' does not exist."
    exit 1
fi

echo "File '$filename' exists."

# -r, -w and -x test read, write and execute permission for the current user
if [ -r "$filename" ]; then
    echo "✓ File is readable"
else
    echo "✗ File is not readable"
fi

if [ -w "$filename" ]; then
    echo "✓ File is writable"
else
    echo "✗ File is not writable"
fi

if [ -x "$filename" ]; then
    echo "✓ File is executable"
else
    echo "✗ File is not executable"
fi
