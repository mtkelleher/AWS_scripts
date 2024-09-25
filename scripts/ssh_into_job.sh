#!/bin/bash

# Note: In line 10 you must replace ip-head-node with your head node's ip!

# Prompt the user for the job ID number
echo "Enter the qstat job id number:"
read input

# Append .ip-head-node to the job id number
input="${input}.ip-head-node"

# Retrieve the compute node's IP address and SSH into it
output=$(qstat -f "$input" | grep exec_host | awk '{print $3}' | cut -d'/' -f1)

echo "Connecting via SSH to $output..."

ssh "$output"
