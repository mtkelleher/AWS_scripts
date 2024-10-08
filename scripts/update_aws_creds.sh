#!/bin/bash

# To get creds visit your AWS SSO Access Panel, select Access keys, and copy Option 2: Add a profile to your AWS credentials file.

# Prompt user to paste the new credentials copied from AWS Access Panel
echo "Paste credentials, press Enter, then Ctrl+D to finish:"

# Use cat to capture multiple lines of input
new_creds=$(cat)

# Extract the last three lines of credentials and replace first line with [default]
new_creds=$(echo -e "[default]\n$(echo "$new_creds" | tail -n 3)")

# Overwrite ~/.aws/credentials
echo "$new_creds" > ~/.aws/credentials

# Output success message
echo "AWS credentials have been updated."
