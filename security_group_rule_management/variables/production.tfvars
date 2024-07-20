# environment variable
environment                = "production"

# Production EKS Security Group Rules
## VPC Access to Prod EKS Cluster
allow_vpc_access_to_eks_description = "allow traffic from within VPC to production EKS cluster"
## HTTP Access to Prod EKS Cluster
allow_http_from_lb_to_eks_http_description = "Allow HTTP traffic from Load Balancer to production EKS cluster"
## HTTPS Access to Prod EKS Cluster
allow_https_from_lb_to_eks_https_description = "Allow HTTPS traffic from Load Balancer to production EKS cluster"
## security group rule to allow worker nodes to communicate with control plane via HTTPS
allow_https_from_worker_nodes_to_eks_control_plane = "allow worker nodes to communicate with control plane via HTTPS"

# Production EKS Node Group Security Group Rule Variables
## production Bastion Host Security Group ssh to EKS node groups
allow_ssh_from_bastion_host_to_eks_nodes_description = "Allow ssh from bastion host to EKS worker nodes"
## EKS control plane communication with worker nodes
allow_inbound_from_eks_control_plane_to_node_group_workers_description = "allow inbound from prod eks control plane to prod eks worker nodes"
## EKS control plane kubelet communication with worker nodes
allow_inbound_kubelet_from_eks_control_plane_to_node_group_workers_description = "allow EKS control plane kubelet communication with worker nodes"
## VPC communication with worker nodes
allow_inbound_vpc_cidr_to_node_group_workers_description = "allow inbound VPC cidr range communication with worker nodes"
## Worker node communication with each other
allow_node_group_worker_communication_description = "allow worker nodes to communicate with each other"

# Production EKS Bastion Host EC2 Security Group Rule Variables
## production Bastion Host Security Group ingress local ips
allow_ssh_from_local_to_bastion_host_description = "allow local ssh into bastian host ec2"
allow_ssh_from_local_to_bastion_host_cidr_blocks = ["148.222.132.208/32","187.246.143.106/32"]

# Production Load Balancer Security Group Rules
## Allow Ingress HTTP Traffic From Internet to Production Load Balancer
lb_ingress_http_cidr_blocks = ["0.0.0.0/0"]
lb_ingress_http_description = "Allow Ingress HTTP Traffic From Internet to Production Load Balancer"
## Allow Ingress HTTPS Traffic From Internet to Production Load Balancer
lb_ingress_https_cidr_blocks = ["0.0.0.0/0"]
lb_ingress_https_description = "Allow Ingress HTTPS Traffic From Internet to Production Load Balancer"