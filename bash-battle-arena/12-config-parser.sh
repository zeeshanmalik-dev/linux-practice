#!/bin/bash
CONFIG_FILE="$1"

while IFS='=' read -r key value; do
    echo "Key: $key | Value: $value"
done < "$CONFIG_FILE"
