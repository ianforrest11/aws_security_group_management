module "prod_ec2_bastion_host_security_group" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group?ref=main"
  name          = var.prod_ec2_bastion_host_sg_name
  description   = var.prod_ec2_bastion_host_sg_description
  vpc_id        = data.aws_vpc.default_vpc.id
  environment   = var.prod_ec2_bastion_host_sg_environment
}

module "prod_eks_security_group" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group?ref=main"
  name        = var.prod_eks_sg_name
  description = var.prod_eks_sg_description
  vpc_id      = data.aws_vpc.default_vpc.id
  environment = var.prod_eks_sg_environment
}

module "prod_eks_node_group_security_group" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group?ref=main"
  name          = var.prod_eks_node_group_sg_name
  description   = var.prod_eks_node_group_sg_description
  vpc_id        = data.aws_vpc.default_vpc.id
  environment   = var.prod_eks_node_group_sg_environment
}

module "prod_lb_security_group" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group?ref=main"
  name          = var.prod_lb_sg_name
  description   = var.prod_lb_sg_description
  vpc_id        = data.aws_vpc.default_vpc.id
  environment   = var.prod_lb_sg_environment
}