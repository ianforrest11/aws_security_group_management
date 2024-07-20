# environment variable
variable "environment" {}

# EC2 Bastion Host Securiy Group Variables
variable "ec2_bastion_host_sg_description" {}
variable "ec2_bastion_host_sg_name" {}

# EKS Securiy Group Variables
variable "eks_sg_description" {}
variable "eks_sg_name" {}

# EKS Securiy Group Variables
variable "eks_node_group_sg_description" {}
variable "eks_node_group_sg_name" {}

# LB Securiy Group Variables
variable "lb_sg_description" {}
variable "lb_sg_name" {}