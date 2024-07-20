# shared security group rule variables
variable "port_65535" {}
variable "port_10250" {}
variable "port_443" {}
variable "port_80" {}
variable "port_22" {}
variable "port_0" {}
variable "rule_type_ingress" {}
variable "rule_type_egress" {}
variable "protocol_tcp" {}
variable "protocol_all" {}
variable "default_egress_description" {}
variable "default_egress_cidr_blocks" {}

# environment variable
variable "environment" {}

# EKS Security Group Rule Variables
## VPC Access to EKS Cluster
variable "allow_vpc_access_to_eks_description" {}
## HTTP Access to EKS Cluster from Load Balancer
variable "allow_http_from_lb_to_eks_http_description" {}
## HTTPS Access to EKS Cluster from Load Balancer
variable "allow_https_from_lb_to_eks_https_description" {}
## security group rule to allow worker nodes to communicate with control plane via HTTPS
variable "allow_https_from_worker_nodes_to_eks_control_plane" {}

# EKS Node Group Security Group Rule Variables
## Bastion Host Security Group ssh to EKS node groups rule
variable "allow_ssh_from_bastion_host_to_eks_nodes_description" {}
## EKS control plane communication with worker nodes
variable "allow_inbound_from_eks_control_plane_to_node_group_workers_description" {}
## EKS control plane kubelet communication with worker nodes
variable "allow_inbound_kubelet_from_eks_control_plane_to_node_group_workers_description" {}
## VPC communication with worker nodes
variable "allow_inbound_vpc_cidr_to_node_group_workers_description" {}
## Worker node communication with each other
variable "allow_node_group_worker_communication_description" {}


# EKS Bastion Host EC2 Security Group Rule Variables
## Bastion Host Security Group ingress home ip
variable "allow_ssh_from_local_to_bastion_host_description" {}
variable "allow_ssh_from_local_to_bastion_host_cidr_blocks" {}

# Load Balancer Security Group Rules
## Allow Ingress HTTP Traffic From Internet to Load Balancer
variable "lb_ingress_http_cidr_blocks" {}
variable "lb_ingress_http_description" {}
## Allow Ingress HTTPS Traffic From Internet to Load Balancer
variable "lb_ingress_https_cidr_blocks" {}
variable "lb_ingress_https_description" {}












