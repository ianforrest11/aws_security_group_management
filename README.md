# aws_security_group_management
managing security groups for portfolio aws account

# modules included:
- security group management
- security group rule management

# AWS Security Group Management
- This module handles the creation and management of Security Groups in AWS. Security Groups act as virtual firewalls for your instances to control inbound and outbound traffic. This README will walk through the creation of Security Groups for an EKS cluster and a Load Balancer, configuring rules to allow HTTP, HTTPS, and internal traffic.
- First, navigate to `security_group_management/terraform/main.tf` and add the following module definitions:
```
module "eks_security_group" {
  source      = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group?ref=main"
  name        = var.eks_sg_name
  description = var.eks_sg_description
  vpc_id      = var.vpc_id
  ingress_rules = var.eks_ingress_rules
  egress_rules  = var.eks_egress_rules
  tags        = var.eks_tags
}

module "lb_security_group" {
  source      = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group?ref=main"
  name        = var.lb_sg_name
  description = var.lb_sg_description
  vpc_id      = var.vpc_id
  ingress_rules = var.lb_ingress_rules
  egress_rules  = var.lb_egress_rules
  tags        = var.lb_tags
}
```
- Next, navigate to `security_group_management/terraform/variables.tf` and add placeholder variables for the security group names, descriptions, VPC ID, tags, and rules:
```
# Variables for the EKS Security Group
variable "eks_sg_name" {
  description = "The name of the EKS security group"
  type        = string
}

variable "eks_sg_description" {
  description = "The description of the EKS security group"
  type        = string
}

variable "eks_tags" {
  description = "Tags for the EKS security group"
  type        = map(string)
}

variable "eks_ingress_rules" {
  description = "A list of ingress rules for the EKS security group"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
    description      = string
  }))
}

variable "eks_egress_rules" {
  description = "A list of egress rules for the EKS security group"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
    description      = string
  }))
}

# Variables for the Load Balancer Security Group
variable "lb_sg_name" {
  description = "The name of the Load Balancer security group"
  type        = string
}

variable "lb_sg_description" {
  description = "The description of the Load Balancer security group"
  type        = string
}

variable "lb_tags" {
  description = "Tags for the Load Balancer security group"
  type        = map(string)
}

variable "lb_ingress_rules" {
  description = "A list of ingress rules for the Load Balancer security group"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
    description      = string
  }))
}

variable "lb_egress_rules" {
  description = "A list of egress rules for the Load Balancer security group"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
    description      = string
  }))
}

# Shared Variables
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
```
- Next, navigate to `security_group_management/terraform/terraform.tfvars` and add the following variable assignments:
```
# Production EKS Security Group HTTP Rules
eks_ingress_rules = [
  {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["10.0.0.0/16"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    description      = "Allow all inbound traffic within the VPC"
  }
]

eks_egress_rules = [
  {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    description      = "Allow all outbound traffic"
  }
]

eks_sg_name       = "prod_eks_security_group"
eks_sg_description = "Security group for EKS production cluster"
eks_tags = {
  Environment = "production"
  Project     = "portfolio_project"
}

# Production Load Balancer Security Group Rules
lb_ingress_rules = [
  {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    description      = "Allow inbound HTTP traffic from anywhere"
  },
  {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    description      = "Allow inbound HTTPS traffic from anywhere"
  }
]

lb_egress_rules = [
  {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    description      = "Allow all outbound traffic"
  }
]

lb_sg_name       = "prod_lb_security_group"
lb_sg_description = "Security group for Load Balancer in EKS production cluster"
lb_tags = {
  Environment = "production"
  Project     = "portfolio_project"
}
```
- Once the updated configuration is pushed to the main branch, the `.github/workflows/terraform.yml` workflow will pick it up and create the security groups and rules in AWS.

# AWS Security Group Rule Management
- This module handles the creation and management of Security Group Rules in AWS. Security Group Rules control the inbound and outbound traffic to instances, acting as virtual firewalls. This README will walk through the creation of Security Group Rules for an EKS cluster, configuring rules to allow HTTP, HTTPS, and internal traffic.
- First, navigate to `security_group_rule_management/terraform/main.tf` and add the following module definition:
```
module "sg_rule_allow_http_from_lb_to_eks" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_rule?ref=main"

  type                     = var.allow_http_from_lb_to_eks_rule_type
  from_port                = var.allow_http_from_lb_to_eks_http_from_port
  to_port                  = var.allow_http_from_lb_to_eks_http_to_port
  protocol                 = var.allow_http_from_lb_to_eks_protocol
  security_group_id        = data.aws_security_group.prod_eks_security_group.id
  source_security_group_id = data.aws_security_group.prod_lb_security_group.id
  description              = var.allow_http_from_lb_to_eks_http_description
}
```
- Next, navigate to `security_group_rule_management/terraform/variables.tf` and add placeholder variables for the security group rules:
```
# Variables for the EKS Security Group Rules
variable "allow_http_from_lb_to_eks_rule_type" {
  description = "The type of rule, ingress or egress"
  type        = string
}

variable "allow_http_from_lb_to_eks_http_from_port" {
  description = "The start port for HTTP"
  type        = number
}

variable "allow_http_from_lb_to_eks_http_to_port" {
  description = "The end port for HTTP"
  type        = number
}

variable "allow_http_from_lb_to_eks_protocol" {
  description = "The protocol for HTTP"
  type        = string
}

variable "allow_http_from_lb_to_eks_http_description" {
  description = "Description of the HTTP security group rule"
  type        = string
}

# Shared Variables
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
```
- Next, navigate to `security_group_rule_management/terraform/terraform.tfvars` and add the following variable assignments:
```
# Production EKS Security Group HTTP Rule
allow_http_from_lb_to_eks_rule_type      = "ingress"
allow_http_from_lb_to_eks_http_from_port = 80
allow_http_from_lb_to_eks_http_to_port   = 80
allow_http_from_lb_to_eks_protocol       = "tcp"
allow_http_from_lb_to_eks_http_description = "Allow HTTP traffic from Load Balancer to EKS"

# VPC ID
vpc_id = "vpc-xxxxxxxx"  # Replace with your actual VPC ID
```
- Ensure your data.tf contains the data sources for the security groups:
```
data "aws_security_group" "prod_lb_security_group" {
  filter {
    name   = "group-name"
    values = ["prod_lb_security_group"]
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_security_group" "prod_eks_security_group" {
  filter {
    name   = "group-name"
    values = ["prod_eks_security_group"]
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
```
- Once the updated configuration is pushed to the main branch, the `.github/workflows/terraform.yml` workflow will pick it up and generate the security group rules on the security groups in AWS