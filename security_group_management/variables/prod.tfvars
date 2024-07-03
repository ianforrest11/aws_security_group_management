### EKS Security Group Variabels ###
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
  }
]
# Allow HTTP and HTTPS traffic from anywhere, and all traffic within the VPC
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
  }
]
eks_sg_name       = "prod_eks_security_group"
eks_sg_description = "security group for eks production cluster"
eks_tags = {
  Environment = "production"
  Project     = "portfolio_project"
}

### LB Security Group Variabels ###
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
  }
]
# Allow HTTP and HTTPS traffic from anywhere, and all traffic within the VPC
lb_ingress_rules = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]  # Allow HTTPS traffic from anywhere
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
lb_sg_name       = "prod_lb_security_group"
lb_sg_description = "security group for eks production cluster"
lb_tags = {
  Environment = "production"
  Project     = "portfolio_project"
}