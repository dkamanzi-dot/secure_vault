#!/bin/bash

# Create secure_vault directory in home
mkdir -p ~/secure_vault

# Create files with welcome messages
echo "Welcome to the keys vault file" > ~/secure_vault/keys.txt
echo "Welcome to the secrets vault file" > ~/secure_vault/secrets.txt
echo "Welcome to the logs vault file" > ~/secure_vault/logs.txt

# Print success message
echo "Secure Vault Setup Completed Successfully!"

# List all files in long format
ls -l ~/secure_vault

