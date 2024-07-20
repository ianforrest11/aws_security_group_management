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

# Prod EKS Security Group Rules
## security group rule to allow prod load balancer to access prod eks cluster via HTTP/HTTPS
module "prod_sg_rule_allow_http_from_lb_to_eks" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                     = var.rule_type_ingress
  from_port                = var.port_80
  to_port                  = var.port_80
  protocol                 = var.protocol_tcp
  security_group_id        = data.aws_security_group.prod_eks_security_group.id
  source_security_group_id = data.aws_security_group.prod_lb_security_group.id
  description              = var.allow_http_from_lb_to_prod_eks_http_description
}
module "prod_sg_rule_allow_https_from_lb_to_eks" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                     = var.rule_type_ingress
  from_port                = var.port_443
  to_port                  = var.port_443
  protocol                 = var.protocol_tcp
  security_group_id        = data.aws_security_group.prod_eks_security_group.id
  source_security_group_id = data.aws_security_group.prod_lb_security_group.id
  description              = var.allow_https_from_lb_to_prod_eks_https_description
}
## security group rule to allow VPC Access to Prod EKS Cluster
module "prod_sg_rule_eks_ingress_vpc" {
  source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                  = var.rule_type_ingress
  from_port             = var.port_0
  to_port               = var.port_0
  protocol              = var.protocol_all
  security_group_id     = data.aws_security_group.prod_eks_security_group.id
  cidr_blocks           = var.allow_vpc_access_to_prod_eks_cidr_blocks
  description           = var.allow_vpc_access_to_prod_eks_description
}

# Prod EKS Node Group Security Group Rules
## security group rule to allow ssh access to eks cluster from bastion host
module "prod_sg_rule_allow_ssh_from_bastion_host_to_eks" {
  source = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                     = var.rule_type_ingress
  from_port                = var.port_22
  to_port                  = var.port_22
  protocol                 = var.protocol_tcp
  security_group_id        = data.aws_security_group.prod_eks_node_group_security_group.id
  source_security_group_id = data.aws_security_group.prod_ec2_bastion_host_security_group.id
  description              = var.allow_ssh_from_bastion_host_to_prod_eks_nodes_description
}

# Prod EKS Bastian Host EC2 Security Group Rules
## security group rule to allow local ssh access to eks cluster bastion host EC2
module "prod_sg_rule_bastion_host_ingress_ssh" {
  source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                  = "ingress"
  from_port             = var.port_22
  to_port               = var.port_22
  protocol              = var.protocol_tcp
  security_group_id     = data.aws_security_group.prod_ec2_bastion_host_security_group.id
  cidr_blocks           = var.allow_ssh_from_local_to_prod_bastion_host_cidr_blocks
  description           = var.allow_ssh_from_local_to_prod_bastion_host_description
}



# Load Balancer Security Group Rules
## security group rules to allow internet access to prod load balancer HTTP/HTTPS
module "prod_sg_rule_lb_ingress_http" {
  source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                  = var.rule_type_ingress
  from_port             = var.port_80
  to_port               = var.port_80
  protocol              = var.protocol_tcp
  security_group_id     = data.aws_security_group.prod_lb_security_group.id
  cidr_blocks           = var.prod_lb_ingress_http_cidr_blocks
  description           = "Allow inbound HTTP traffic from anywhere"
}
module "prod_sg_rule_lb_ingress_https" {
  source                = "git@github.com:ianforrest11/aws_terraform_security_group_templates.git//security_group_rule?ref=main"
  type                  = var.rule_type_ingress
  from_port             = var.port_443
  to_port               = var.port_443
  protocol              = var.protocol_tcp
  security_group_id     = data.aws_security_group.prod_lb_security_group.id
  cidr_blocks           = var.prod_lb_ingress_https_cidr_blocks
  description           = "Allow inbound HTTPS traffic from anywhere"
}
