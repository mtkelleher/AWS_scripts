#!/bin/bash

# Prompt the user for the job ID number
echo "Enter the qstat job id number:"
read input

# Extract the part before the first period from the hostname and prepend "ip-"
host_ip=$(hostname | cut -d'.' -f1)

# Append .{host_ip} to the job id number
input="${input}.${host_ip}"

# Retrieve the compute node's IP address and SSH into it
output=$(qstat -f "$input" | grep exec_host | awk '{print $3}' | cut -d'/' -f1)

echo "Connecting via SSH to $output..."

ssh "$output"
