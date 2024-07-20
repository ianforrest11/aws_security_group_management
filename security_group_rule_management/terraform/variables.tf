# shared variables
variable "port_443" {}
variable "port_80" {}
variable "port_22" {}
variable "port_0" {}
variable "rule_type_ingress" {}
variable "rule_type_egress" {}
variable "protocol_tcp" {}
variable "protocol_all" {}
variable "default_egress_description" {}

# production EKS Security Group Http rule
variable "allow_http_from_lb_to_prod_eks_http_description" {}

# production EKS Security Group Https rule
variable "allow_https_from_lb_to_prod_eks_https_description" {}

# production Bastion Host Security Group ssh to EKS rule
variable "allow_ssh_from_bastion_host_to_prod_eks_nodes_description" {}













