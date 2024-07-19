# Production EKS Security Group HTTP Rules
allow_http_from_lb_to_prod_eks_rule_type      = "ingress"
allow_http_from_lb_to_prod_eks_http_from_port = 80
allow_http_from_lb_to_prod_eks_http_to_port   = 80
allow_http_from_lb_to_prod_eks_protocol       = "tcp"
allow_http_from_lb_to_prod_eks_http_description = "Allow HTTP traffic from Load Balancer to EKS"

# Production EKS Security Group HTTPS Rules
allow_https_from_lb_to_prod_eks_rule_type         = "ingress"
allow_https_from_lb_to_prod_eks_https_from_port   = 443
allow_https_from_lb_to_prod_eks_https_to_port     = 443
allow_https_from_lb_to_prod_eks_protocol          = "tcp"
allow_https_from_lb_to_prod_eks_https_description = "Allow HTTPS traffic from Load Balancer to EKS"

# Production bastion host ssh to EKS node groups Rules
allow_ssh_from_bastion_host_to_prod_eks_rule_type   = "ingress"
allow_ssh_from_bastion_host_to_prod_eks_from_port   = 22
allow_ssh_from_bastion_host_to_prod_eks_to_port     = 22
allow_ssh_from_bastion_host_to_prod_eks_protocol    = "tcp"
allow_ssh_from_bastion_host_to_prod_eks_description = "Allow ssh from bastion host to EKS worker nodes"
