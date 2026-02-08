#!/bin/bash

VAULT_DIR=~/secure_vault

# Check if secure_vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: secure_vault directory not found!"
    exit 1
fi

# Function to update permissions
update_perm() {
    FILE=$1
    DEFAULT=$2

    echo "Current permission for $FILE:"
    ls -l $VAULT_DIR/$FILE

    echo -n "Do you want to change permission for $FILE? (yes/no): "
    read ANSWER

    if [ "$ANSWER" = "yes" ]; then
        echo -n "Enter new permission (e.g., 600): "
        read NEWPERM

        if [ -z "$NEWPERM" ]; then
            chmod $DEFAULT $VAULT_DIR/$FILE
            echo "No input. Default permission $DEFAULT applied."
        else
            chmod $NEWPERM $VAULT_DIR/$FILE
            echo "Permission updated to $NEWPERM."
        fi
    else
        echo "Permission unchanged."
    fi
}

# Call function for each file
update_perm keys.txt 600
update_perm secrets.txt 640
update_perm logs.txt 644

# Show final permissions
echo "Final file permissions:"
ls -l $VAULT_DIR

