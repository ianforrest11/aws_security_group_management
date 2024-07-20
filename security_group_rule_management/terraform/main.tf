# General outbound rule
module "general_outbound_sg_rule" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule_outbound_general?ref=main"
  type                     = var.rule_type_egress
  from_port                = var.port_0
  to_port                  = var.port_0
  protocol                 = var.protocol_all
  cidr_blocks              = var.default_egress_cidr_blocks
  security_group_ids       = [
    data.aws_security_group.prod_eks_security_group.id,
    data.aws_security_group.prod_eks_node_group_security_group.id,
    data.aws_security_group.prod_lb_security_group.id,
    data.aws_security_group.prod_ec2_bastion_host_security_group.id
  ]
  description              = var.default_egress_description
}

# security group module to open eks cluster to load balancer
module "sg_rule_allow_http_from_lb_to_eks" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                     = var.rule_type_ingress
  from_port                = var.port_80
  to_port                  = var.port_80
  protocol                 = var.protocol_tcp
  security_group_id        = data.aws_security_group.prod_eks_security_group.id
  source_security_group_id = data.aws_security_group.prod_lb_security_group.id
  description              = var.allow_http_from_lb_to_prod_eks_http_description
}
module "sg_rule_allow_https_from_lb_to_eks" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                     = var.rule_type_ingress
  from_port                = var.port_443
  to_port                  = var.port_443
  protocol                 = var.protocol_tcp
  security_group_id        = data.aws_security_group.prod_eks_security_group.id
  source_security_group_id = data.aws_security_group.prod_lb_security_group.id
  description              = var.allow_https_from_lb_to_prod_eks_https_description
}

# security group module to allow ssh access to eks cluster from bastion host
module "sg_rule_allow_ssh_from_bastion_host_to_eks" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                     = var.rule_type_ingress
  from_port                = var.port_22
  to_port                  = var.port_22
  protocol                 = var.protocol_tcp
  security_group_id        = data.aws_security_group.prod_eks_node_group_security_group.id
  source_security_group_id = data.aws_security_group.prod_ec2_bastion_host_security_group.id
  description              = var.allow_ssh_from_bastion_host_to_prod_eks_nodes_description
}

module "sg_rule_bastion_host_ingress_ssh" {
  source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                  = "ingress"
  from_port             = var.port_22
  to_port               = var.port_22
  protocol              = var.protocol_tcp
  security_group_id     = data.aws_security_group.prod_ec2_bastion_host_security_group.id
  cidr_blocks           = var.allow_ssh_from_local_to_prod_bastion_host_cidr_blocks
  description           = var.allow_ssh_from_local_to_prod_bastion_host_description
}

# module "sg_rule_bastion_host_ingress_ssh_2" {
#   source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
#   type                  = "ingress"
#   from_port             = 22
#   to_port               = 22
#   protocol              = "tcp"
#   security_group_id     = var.prod_ec2_bastion_host_security_group_id
#   cidr_blocks           = var.bastion_host_ingress_ssh_cidr_blocks_2
#   description           = "Allow ssh from bastion host EC2"
# }

# # EKS Security Group Rules
# module "sg_rule_eks_ingress_vpc" {
#   source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
#   type                  = "ingress"
#   from_port             = 0
#   to_port               = 0
#   protocol              = "-1"
#   security_group_id     = var.prod_eks_security_group_id
#   cidr_blocks           = var.eks_ingress_vpc_cidr_blocks
#   description           = "Allow all inbound traffic within the VPC"
# }

# # EKS Node Group Security Group Rules
# module "sg_rule_eks_node_group_ingress_ssh" {
#   source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
#   type                  = "ingress"
#   from_port             = 22
#   to_port               = 22
#   protocol              = "tcp"
#   security_group_id     = var.prod_eks_node_group_security_group_id
#   cidr_blocks           = var.eks_node_group_ingress_ssh_cidr_blocks
#   description           = "Allow SSH access from a specific IP address"
# }

# # Load Balancer Security Group Rules
# module "sg_rule_lb_ingress_http" {
#   source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
#   type                  = "ingress"
#   from_port             = 80
#   to_port               = 80
#   protocol              = "tcp"
#   security_group_id     = var.prod_lb_security_group_id
#   cidr_blocks           = var.lb_ingress_http_cidr_blocks
#   description           = "Allow inbound HTTP traffic from anywhere"
# }

# module "sg_rule_lb_ingress_https" {
#   source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
#   type                  = "ingress"
#   from_port             = 443
#   to_port               = 443
#   protocol              = "tcp"
#   security_group_id     = var.prod_lb_security_group_id
#   cidr_blocks           = var.lb_ingress_https_cidr_blocks
#   description           = "Allow inbound HTTPS traffic from anywhere"
# }
