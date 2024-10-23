#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

# Step 1: Navigate to your home directory
cd ~

# Step 2: Ensure the .ssh directory exists
mkdir -p .ssh

# Step 3: Create the config file if it doesn't exist
touch .ssh/config

# Step 4: Check if the NUSPACE_USR environment variable is set
if [[ -z "$NUSPACE_USR" ]]; then
  echo "Error: The environment variable NUSPACE_USR is not set."
  exit 1
fi

# Step 5: Check if the configuration already exists
if grep -q "Host nuwebspace" .ssh/config; then
  echo "Configuration for 'nuwebspace' already exists in .ssh/config."
else
  # Step 6: Append the configuration to the config file
  cat <<EOL >> .ssh/config

### NUwebspace
Host nuwebspace
  User $NUSPACE_USR
  HostName $NUSPACE_USR
  Port 22
  ProxyJump $NUSPACE_USR@nuwebspace.co.uk
###
EOL
  echo "SSH configuration added to .ssh/config."
fi

# Step 7: Set appropriate permissions
chmod 700 .ssh
chmod 600 .ssh/config

echo "Permissions set for .ssh directory and config file."
