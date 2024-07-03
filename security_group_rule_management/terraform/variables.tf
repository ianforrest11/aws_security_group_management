# production EKS Security Group Http rules
variable "allow_http_from_lb_to_prod_eks_rule_type" {
  description = "The type of rule, ingress or egress"
  type        = string
}
variable "allow_http_from_lb_to_prod_eks_http_from_port" {
  description = "The start port for HTTP"
  type        = number
}
variable "allow_http_from_lb_to_prod_eks_http_to_port" {
  description = "The end port for HTTP"
  type        = number
}
variable "allow_http_from_lb_to_prod_eks_protocol" {
  description = "The start port for HTTPS"
  type        = number
}
variable "allow_http_from_lb_to_prod_eks_http_description" {
  description = "description of security group rule"
  type        = string
}

# production EKS Security Group Https rules
variable "allow_https_from_lb_to_prod_eks_rule_type" {
  description = "The type of rule, ingress or egress"
  type        = string
}
variable "allow_https_from_lb_to_prod_eks_https_from_port" {
  description = "The start port for HTTP"
  type        = number
}
variable "allow_https_from_lb_to_prod_eks_https_to_port" {
  description = "The end port for HTTP"
  type        = number
}
variable "allow_https_from_lb_to_prod_eks_protocol" {
  description = "The start port for HTTPS"
  type        = number
}
variable "allow_https_from_lb_to_prod_eks_https_description" {
  description = "description of security group rule"
  type        = string
}

# vpc_id variable to plug into data resource for security group filtering
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}













