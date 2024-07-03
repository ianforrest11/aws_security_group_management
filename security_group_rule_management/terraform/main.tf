# security group module to open eks cluster to 
module "sg_rule_allow_http_from_lb_to_eks" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group_rule?ref=main"
  type                     = var.allow_http_from_lb_to_prod_eks_rule_type
  from_port                = var.allow_http_from_lb_to_prod_eks_http_from_port
  to_port                  = var.allow_http_from_lb_to_prod_eks_http_to_port
  protocol                 = var.allow_http_from_lb_to_prod_eks_protocol
  security_group_id        = data.aws_security_group.prod_eks_security_group.id
  source_security_group_id = data.aws_security_group.prod_lb_security_group.id
  description              = var.allow_http_from_lb_to_prod_eks_http_description
}

module "sg_rule_allow_https_from_lb_to_eks" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/security_group_security_group_rule?ref=main"
  type                     = var.allow_https_from_lb_to_prod_eks_rule_type
  from_port                = var.allow_https_from_lb_to_prod_eks_https_from_port
  to_port                  = var.allow_https_from_lb_to_prod_eks_https_to_port
  protocol                 = var.allow_https_from_lb_to_prod_eks_protocol
  security_group_id        = data.aws_security_group.prod_eks_security_group.id
  source_security_group_id = data.aws_security_group.prod_lb_security_group.id
  description              = var.allow_https_from_lb_to_prod_eks_https_description
}