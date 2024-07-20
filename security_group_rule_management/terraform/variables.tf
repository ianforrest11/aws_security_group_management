# shared security group rule variables
variable "port_443" {}
variable "port_80" {}
variable "port_22" {}
variable "port_0" {}
variable "rule_type_ingress" {}
variable "rule_type_egress" {}
variable "protocol_tcp" {}
variable "protocol_all" {}
variable "default_egress_description" {}
variable "default_egress_cidr_blocks" {}

# Production EKS Security Group Rule Variables
## VPC Access to Prod EKS Cluster
variable "allow_vpc_access_to_prod_eks_cidr_blocks" {}
variable "allow_vpc_access_to_prod_eks_description" {}
## HTTP Access to Prod EKS Cluster
variable "allow_http_from_lb_to_prod_eks_http_description" {}
## HTTPS Access to Prod EKS Cluster
variable "allow_https_from_lb_to_prod_eks_https_description" {}

# Production EKS Node Group Security Group Rule Variables
## production Bastion Host Security Group ssh to EKS node groups rule
variable "allow_ssh_from_bastion_host_to_prod_eks_nodes_description" {}

# Production EKS Bastion Host EC2 Security Group Rule Variables
# production Bastion Host Security Group ingress home ip
variable "allow_ssh_from_local_to_prod_bastion_host_description" {}
variable "allow_ssh_from_local_to_prod_bastion_host_cidr_blocks" {}













