# Shared Variables
port_443                   = 443
port_80                    = 80
port_22                    = 22
port_0                     = 0
rule_type_ingress          = "ingress"
rule_type_egress           = "egress"
protocol_all               = "-1"
protocol_tcp               = "tcp"
default_egress_description = "Allow all outbound traffic"
default_egress_cidr_blocks = ["0.0.0.0/0"]

# Production EKS Security Group Rules
## VPC Access to Prod EKS Cluster
allow_vpc_access_to_prod_eks_cidr_blocks = ["10.0.0.0/16"]
allow_vpc_access_to_prod_eks_description = "allow traffic from within VPC to production EKS cluster"
## HTTP Access to Prod EKS Cluster
allow_http_from_lb_to_prod_eks_http_description = "Allow HTTP traffic from Load Balancer to production EKS cluster"
## HTTPS Access to Prod EKS Cluster
allow_https_from_lb_to_prod_eks_https_description = "Allow HTTPS traffic from Load Balancer to production EKS cluster"

# Production EKS Node Group Security Group Rule Variables
## production Bastion Host Security Group ssh to EKS node groups
allow_ssh_from_bastion_host_to_prod_eks_nodes_description = "Allow ssh from bastion host to EKS worker nodes"

# Production EKS Bastion Host EC2 Security Group Rule Variables
# production Bastion Host Security Group ingress home ip
allow_ssh_from_local_to_prod_bastion_host_description = "allow local ssh into bastian host ec2"
allow_ssh_from_local_to_prod_bastion_host_cidr_blocks = ["148.222.132.208/32","187.246.143.106/32"]
