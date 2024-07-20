data "aws_vpc" "default_vpc" {
  filter {
    name   = "tag:Name"
    values = ["default_vpc"]
  }
}

data "aws_security_group" "lb_security_group" {
  filter {
    name   = "group-name"
    values = ["${var.environment}_lb_security_group"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

data "aws_security_group" "eks_security_group" {
  filter {
    name   = "group-name"
    values = ["${var.environment}_eks_security_group"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

data "aws_security_group" "eks_node_group_security_group" {
  filter {
    name   = "group-name"
    values = ["${var.environment}_eks_node_group_security_group"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

data "aws_security_group" "ec2_bastion_host_security_group" {
  filter {
    name   = "group-name"
    values = ["${var.environment}_ec2_bastion_host_security_group"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}