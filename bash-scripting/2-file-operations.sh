#!/bin/bash
# File operations script
# Creates a directory, makes a file inside it, writes the date into it, then shows it

# -p stops an error if the directory already exists
mkdir -p bash_demo
echo "Directory 'bash_demo' created."

# Move into the new directory (exit if that somehow fails)
cd bash_demo || exit 1

# $(date +%Y-%m-%d) inserts today's date, and > writes the text into demo.txt
echo "This file was created by a Bash script on $(date +%Y-%m-%d)" > demo.txt
echo "File 'demo.txt' created."

echo ""
echo "File contents:"
cat demo.txt
