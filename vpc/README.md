Ticket-1
Note: all tasks are to be performed on bastion host

Prerequisites:
Create or use a repo "interactive-learning-tasks" with the following files:

README.md
.gitignore for Terraform
Clone the repo to your home directory.

In interactive-learning-tasks/vpc folder please create file for following tasks.

Create provider.tf, and define provider and region

region = "eu-west-1"
Create vpc.tf

Create a VPC
Create subnets In different A-Z. Each subnet should have 250+ usable IP.

3 Public Subnets
3 Private Subnets
Each resource should contain the following tags:

Team = DevOps
Environment = Dev
Public subnets Route to IGW

Private Subnets Route to NGW

To check run:
On Visual Studio Code
curl link | sh
