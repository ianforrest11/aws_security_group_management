# EC2 Bastion Host Securiy Group Variables
variable "ec2_bastion_host_egress_rules" {}
variable "ec2_bastion_host_ingress_rules" {}
variable "ec2_bastion_host_sg_description" {}
variable "ec2_bastion_host_sg_name" {}
variable "ec2_bastion_host_tags" {}

# EKS Securiy Group Variables
variable "eks_egress_rules" {}
variable "eks_ingress_rules" {}
variable "eks_sg_description" {}
variable "eks_sg_name" {}
variable "eks_tags" {}

# EKS Securiy Group Variables
variable "eks_node_group_egress_rules" {}
variable "eks_node_group_ingress_rules" {}
variable "eks_node_group_sg_description" {}
variable "eks_node_group_sg_name" {}
variable "eks_node_group_tags" {}

# LB Securiy Group Variables
variable "lb_egress_rules" {}
variable "lb_ingress_rules" {}
variable "lb_sg_description" {}
variable "lb_sg_name" {}
variable "lb_tags" {}








