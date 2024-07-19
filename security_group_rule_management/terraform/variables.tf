# production EKS Security Group Http rule
variable "allow_http_from_lb_to_prod_eks_rule_type" {}
variable "allow_http_from_lb_to_prod_eks_http_from_port" {}
variable "allow_http_from_lb_to_prod_eks_http_to_port" {}
variable "allow_http_from_lb_to_prod_eks_protocol" {}
variable "allow_http_from_lb_to_prod_eks_http_description" {}

# production EKS Security Group Https rule
variable "allow_https_from_lb_to_prod_eks_rule_type" {}
variable "allow_https_from_lb_to_prod_eks_https_from_port" {}
variable "allow_https_from_lb_to_prod_eks_https_to_port" {}
variable "allow_https_from_lb_to_prod_eks_protocol" {}
variable "allow_https_from_lb_to_prod_eks_https_description" {}

# production Bastion Host Security Group ssh to EKS rule
variable "allow_ssh_from_bastion_host_to_prod_eks_rule_type" {}
variable "allow_ssh_from_bastion_host_to_prod_eks_from_port" {}
variable "allow_ssh_from_bastion_host_to_prod_eks_to_port" {}
variable "allow_ssh_from_bastion_host_to_prod_eks_protocol" {}
variable "allow_ssh_from_bastion_host_to_prod_eks_description" {}













