### EKS Security Group Variables ###
ec2_bastion_host_egress_rules = [
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
ec2_bastion_host_ingress_rules = [
  # Allow all traffic within the VPC
  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["187.246.143.106/32"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    description      = "Allow ssh from bastion host EC2"
  }
]
ec2_bastion_host_sg_name        = "prod_ec2_bastion_host_security_group"
ec2_bastion_host_sg_description = "Security group for bastion EC2 to access EKS production cluster"
ec2_bastion_host_tags = {
  Environment = "production"
  Project     = "portfolio_project"
}

### EKS Security Group Variables ###
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
eks_ingress_rules = [
  # Allow all traffic within the VPC
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
eks_sg_name       = "prod_eks_security_group"
eks_sg_description = "Security group for EKS production cluster"
eks_tags = {
  Environment = "production"
  Project     = "portfolio_project"
}

### EKS Node Group Security Group Variables ###
eks_node_group_egress_rules = [
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
eks_node_group_ingress_rules = [
  # Allow SSH access from a specific IP address
  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["187.246.143.106/32"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    description      = "Allow SSH access from a specific IP address"
  }
]
eks_node_group_sg_name        = "prod_eks_node_group_security_group"
eks_node_group_sg_description = "Security group for node groups in EKS production cluster"
eks_node_group_tags = {
  Environment = "production"
  Project     = "portfolio_project"
}