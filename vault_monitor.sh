#!/bin/bash

VAULT_DIR=~/secure_vault
REPORT="$VAULT_DIR/vault_report.txt"

# Check if vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: secure_vault directory not found!"
    exit 1
fi

# Clear old report
echo "===== SECURE VAULT MONITORING REPORT =====" > "$REPORT"
date >> "$REPORT"
echo "----------------------------------------" >> "$REPORT"

# Loop through files in vault
for FILE in "$VAULT_DIR"/*
do
    FILENAME=$(basename "$FILE")
    SIZE=$(stat -c %s "$FILE")
    MODIFIED=$(stat -c %y "$FILE")
    PERM=$(stat -c %a "$FILE")

    echo "File: $FILENAME" >> "$REPORT"
    echo "Size: $SIZE bytes" >> "$REPORT"
    echo "Last Modified: $MODIFIED" >> "$REPORT"
    echo "Permissions: $PERM" >> "$REPORT"

    # Check for risky permissions (greater than 644)
    if [ "$PERM" -gt 644 ]; then
        echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT"
    fi

    echo "----------------------------------------" >> "$REPORT"
done

# Print confirmation
echo "Vault monitoring report created at $REPORT"

