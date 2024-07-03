# production EKS Security Group Http rules
variable "allow_http_from_lb_to_prod_eks_rule_type" {}
variable "allow_http_from_lb_to_prod_eks_http_from_port" {}
variable "allow_http_from_lb_to_prod_eks_http_to_port" {}
variable "allow_http_from_lb_to_prod_eks_protocol" {}
variable "allow_http_from_lb_to_prod_eks_http_description" {}

# production EKS Security Group Https rules
variable "allow_https_from_lb_to_prod_eks_rule_type" {}
variable "allow_https_from_lb_to_prod_eks_https_from_port" {}
variable "allow_https_from_lb_to_prod_eks_https_to_port" {}
variable "allow_https_from_lb_to_prod_eks_protocol" {}
variable "allow_https_from_lb_to_prod_eks_https_description" {}

# vpc_id variable to plug into data resource for security group filtering
variable "vpc_id" {}













