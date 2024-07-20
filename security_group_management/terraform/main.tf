module "ec2_bastion_host_security_group" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group?ref=main"
  name          = var.ec2_bastion_host_sg_name
  description   = var.ec2_bastion_host_sg_description
  vpc_id        = data.aws_vpc.default_vpc.id
  environment   = var.environment
}

module "eks_security_group" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group?ref=main"
  name        = var.eks_sg_name
  description = var.eks_sg_description
  vpc_id      = data.aws_vpc.default_vpc.id
  environment = var.environment
}

module "eks_node_group_security_group" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group?ref=main"
  name          = var.eks_node_group_sg_name
  description   = var.eks_node_group_sg_description
  vpc_id        = data.aws_vpc.default_vpc.id
  environment   = var.environment
}

module "lb_security_group" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group?ref=main"
  name          = var.lb_sg_name
  description   = var.lb_sg_description
  vpc_id        = data.aws_vpc.default_vpc.id
  environment   = var.environment
}