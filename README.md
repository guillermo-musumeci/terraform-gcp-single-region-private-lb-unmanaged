# Deploying GCP VMs in unmanaged instance group with a load balancer using Terraform

The script will install two Ubuntu instances with Apache web server located in private subnet, without public ip, inside an unmanaged instance group, with a load balancer using Terraform.

lb-unmanaged.tf --> Create unmanaged instance group, backend services and all components required by the load balancer 

network-firewall.tf --> Configure basic firewall for the network

network-variables.tf --> Define network variables

network.tf --> Define network, vpc, subnet, icmp firewall

provider.tf --> Configure Google Cloud provider

terraform.tfvars --> Defining variables 

variables-auth.tf --> Application and authentication variables

vm-output.tf --> Output of VMs 

vm.tf --> Create two Ubuntu VMs with Apache web server

# Notes

Check list of Google Cloud OS images --> https://cloud.google.com/compute/docs/images

Create the Json file for authentication --> https://cloud.google.com/iam/docs/creating-managing-service-account-keys

Read the post for the repo --> https://medium.com/@gmusumeci/getting-started-with-terraform-and-google-cloud-platform-gcp-deploying-vms-in-a-private-only-f9ab61fa7d15
