# environment variable
environment                = "production"

### Prod EKS Bastion Host Security Group Variables ###
ec2_bastion_host_sg_name           = "prod_ec2_bastion_host_security_group"
ec2_bastion_host_sg_description    = "Security group for bastion EC2 to access EKS production cluster"

### Prod EKS Security Group Variables ###
eks_sg_name        = "prod_eks_security_group"
eks_sg_description = "Security group for EKS production cluster"

### Prod EKS Node Group Security Group Variables ###
eks_node_group_sg_name        = "prod_eks_node_group_security_group"
eks_node_group_sg_description = "Security group for node groups in EKS production cluster"

### Prod LB Security Group Variables ###
lb_sg_name        = "prod_lb_security_group"
lb_sg_description = "Security group for Load Balancer in EKS production cluster"