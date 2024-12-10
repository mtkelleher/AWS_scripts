#!/bin/bash

# Prompt the user for the job ID number
echo "Enter the qstat job id number:"
read input

# Append .ip-{hostname -i} to the job id number
input="${input}.ip-$(hostname -i)"

# Retrieve the compute node's IP address and SSH into it
output=$(qstat -f "$input" | grep exec_host | awk '{print $3}' | cut -d'/' -f1)

echo "Connecting via SSH to $output..."

ssh "$output"
