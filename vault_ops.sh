#!/bin/bash

VAULT_DIR=~/secure_vault
SECRETS="$VAULT_DIR/secrets.txt"
LOGS="$VAULT_DIR/logs.txt"
KEYS="$VAULT_DIR/keys.txt"

# Check vault directory
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: secure_vault not found!"
    exit 1
fi

# Loop menu forever
while true
do
    echo "================ Secure Vault Menu ================"
    echo "1) Add Secret"
    echo "2) Update Secret"
    echo "3) Add Log Entry"
    echo "4) Access Keys"
    echo "5) Exit"
    echo "=================================================="
    echo -n "Choose an option: "
    read CHOICE

    case $CHOICE in

        1)
            echo -n "Enter secret to add: "
            read SECRET
            echo "$SECRET" >> "$SECRETS"
            echo "Secret added."
            ;;

        2)
            echo -n "Enter secret to replace: "
            read OLD
            echo -n "Enter new secret: "
            read NEW

            if grep -q "$OLD" "$SECRETS"; then
                sed -i "s/$OLD/$NEW/g" "$SECRETS"
                echo "Secret updated."
            else
                echo "No match found."
            fi
            ;;

        3)
            TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
            echo "$TIMESTAMP - Log entry added" >> "$LOGS"
            echo "Log saved."
            ;;

        4)
            echo "ACCESS DENIED 🚫"
            ;;

        5)
            echo "Exiting Secure Vault..."
            break
            ;;

        *)
            echo "Invalid option. Try again."
            ;;
    esac

done

