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

# Production EKS Security Group HTTP Rules
allow_http_from_lb_to_prod_eks_http_description = "Allow HTTP traffic from Load Balancer to EKS"

# Production EKS Security Group HTTPS Rules
allow_https_from_lb_to_prod_eks_https_description = "Allow HTTPS traffic from Load Balancer to EKS"

# Production bastion host ssh to EKS node groups Rules
allow_ssh_from_bastion_host_to_prod_eks_nodes_description = "Allow ssh from bastion host to EKS worker nodes"

# production Bastion Host Security Group ingress home ip
allow_ssh_from_local_to_prod_bastion_host_description = "allow local ssh into bastian host"
allow_ssh_from_local_to_prod_bastion_host_cidr_blocks = ["148.222.132.208/32","187.246.143.106/32"]
