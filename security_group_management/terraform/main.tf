module "ec2_bastion_host_security_group" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group?ref=main"

  name        = var.ec2_bastion_host_sg_name
  description = var.ec2_bastion_host_sg_description
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress_rules = var.ec2_bastion_host_ingress_rules
  egress_rules  = var.ec2_bastion_host_egress_rules

  tags = var.ec2_bastion_host_tags
}

module "eks_security_group" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group?ref=main"

  name        = var.eks_sg_name
  description = var.eks_sg_description
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress_rules = var.eks_ingress_rules
  egress_rules  = var.eks_egress_rules

  tags = var.eks_tags
}

module "eks_node_group_security_group" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group?ref=main"

  name        = var.eks_node_group_sg_name
  description = var.eks_node_group_sg_description
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress_rules = var.eks_node_group_ingress_rules
  egress_rules  = var.eks_node_group_egress_rules

  tags = var.eks_node_group_tags
}

module "lb_security_group" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group?ref=main"

  name        = var.lb_sg_name
  description = var.lb_sg_description
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress_rules = var.lb_ingress_rules
  egress_rules  = var.lb_egress_rules

  tags = var.lb_tags
}