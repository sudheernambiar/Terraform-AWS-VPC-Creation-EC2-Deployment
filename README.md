# Terraform-AWS-VPC-Creation-EC2-Deployment
Associated with https://github.com/sudheernambiar/Terraform-AWS-VPC-Creation 

## Prerequisites 
- terraform installed
- Need to be deployed in the same location with all files in the repo https://github.com/sudheernambiar/Terraform-AWS-VPC-Creation.
- Except all details above is not there, we cannot execute these files as usual. However you can edit this one and use.

## Files explained
### instance.tf
This file contains all important aspects about the instance, where this machine is deployed, type, ami keys to use security groups etc.
### Key files
you should need to create a keypair with ssh-keygen and must save public key as "save.pub" (use the key name save to make public file like this). The private file can be used to login in to the system.
### enableroot.sh Shell file 
this helps to enable root access to these instances directly(for bypassing keys -if needed)

### Execution steps
- Git clone all files to necessary directory. Also get all files in the repository https://github.com/sudheernambiar/Terraform-AWS-VPC-Creation.
- terraform init to create the provider(if installed earlier you can avoid this step.)
- terraform plan to verify
- terraform apply the approve it(or terraform apply -auto-approve)

### Result
- From previous vpc creation, an entire VPC with 6 subnets two Route tables for public and private subnets(3 subnets in public and 3 in private). 3 security groups for a bastien/jump servers, a webserver for 80/443 permitted to public, a database completely inside can host.
- 3 instances with different access model of a jump server, a webserver and a mysql server will be deployed.
