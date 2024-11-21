# AWS scripts repository
This repository contains useful scripts to help automate common tasks when working with AWS services. Below is an overview of the scripts included and instructions for their usage.

## Helpful Aliases
### 1. .zprofile (local)


### 2. .bashrc (SOCA)
Mount S3 to an EFS directory from an EC2 instance. This can be used once [`update_aws_creds.sh`](./scripts/update_aws_creds.sh) has been run. It is also useful to mount to an empty directory. I recommend first creating the directory ~/s3, which can be accomplished by running `mkdir ~/s3`.

`alias mounts3="mount-s3 ddpsc-baxterlab ~/s3"`

Get qstat info for your username. This is helpful when there are many jobs that have been started from the head node.

`alias qstatme="qstat | head -n 2; qstat | grep $(whoami)"`

## Scripts
### 1. update_aws_creds.sh
Purpose:
This script allows you to quickly update your AWS credentials by pasting them directly from the AWS SSO access panel. It is designed to overwrite your existing credentials file with newly provided credentials. Since credentials often need to be updated, this script saves time by avoiding manual edits or multiple copy-paste steps.

Usage:
1. First, save the script or clone the repository, then make the script executable:

       chmod +x update_aws_creds.sh

2. Visit your AWS SSO Access Panel, select Access keys, and copy Option 2: Add a profile to your AWS credentials file.
3. Run the script:

       ./update_aws_creds.sh

5. You will be prompted to paste your new credentials. Once pasted, press `Enter` and then `Ctrl+D` to finish.
6. The credentials will be automatically saved to `~/.aws/credentials`.

Script:
[`update_aws_creds.sh`](./scripts/update_aws_creds.sh)

### 2. ssh_into_job.sh
Purpose:
This script is used for SSHing into a running EC2 instance (job) from an interactive session on the head node. The IP of the instance is retrieved based on the job ID from `qstat` (formatted as `jobidnum.ip-*`), which is then used to establish the SSH connection. It is a quick way to access a running job, where you can interactively use tools like htop to check memory and CPU usage.


Note: In line 10 of [`ssh_into_job.sh`](./scripts/ssh_into_job.sh) you must replace `ip-head-node` with your head node's ip! You can also view job details in SOCA via your web browser.

Usage:
1. First, save the script or clone the repository, and make it executable:

       chmod +x ssh_into_job.sh
  
2. Run `qstat` to see the list of running jobs.
3. Copy the job ID of the job you wish to SSH into.
4. Run the script:

       ./ssh_into_job.sh

5. Paste the job ID and press `Enter` when prompted.
6. The script will retrieve the compute node IP where the job is running and initiate an SSH connection to that node.

Script:
[`ssh_into_job.sh`](./scripts/ssh_into_job.sh)

## Getting Started
#### Prerequisites:
Ensure you have the necessary permissions for SSH access to SOCA, S3 access, and access to the AWS SSO.

#### Installation:
1. Clone this repository:

       git clone https://github.com/mtkelleher/AWS_scripts.git

2. Make the scripts executable:

       chmod +x update_aws_creds.sh ssh_into_job.sh

## Contribution:
Feel free to fork this repository and submit pull requests for any new AWS-related scripts or improvements to existing ones.

##
Let me know if you have any questions!

