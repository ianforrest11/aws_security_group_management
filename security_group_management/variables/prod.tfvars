### Prod EKS Bastion Host Security Group Variables ###
prod_ec2_bastion_host_sg_name           = "prod_ec2_bastion_host_security_group"
prod_ec2_bastion_host_sg_description    = "Security group for bastion EC2 to access EKS production cluster"
prod_ec2_bastion_host_sg_environment    = "production"

### Prod EKS Security Group Variables ###
prod_eks_sg_name        = "prod_eks_security_group"
prod_eks_sg_description = "Security group for EKS production cluster"
prod_eks_sg_environment = "production"

### Prod EKS Node Group Security Group Variables ###
prod_eks_node_group_sg_name        = "prod_eks_node_group_security_group"
prod_eks_node_group_sg_description = "Security group for node groups in EKS production cluster"
prod_eks_node_group_sg_environment = "production"

### Prod LB Security Group Variables ###
prod_lb_sg_name        = "prod_lb_security_group"
prod_lb_sg_description = "Security group for Load Balancer in EKS production cluster"
prod_lb_sg_environment = "production"
