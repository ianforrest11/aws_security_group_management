data "aws_vpc" "default_vpc" {
  filter {
    name   = "tag:Name"
    values = ["default_vpc"]
  }
}

data "aws_security_group" "prod_lb_security_group" {
  filter {
    name   = "group-name"
    values = ["prod_lb_security_group"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

data "aws_security_group" "prod_eks_security_group" {
  filter {
    name   = "group-name"
    values = ["prod_eks_security_group"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

data "aws_security_group" "prod_ec2_bastion_host_security_group" {
  filter {
    name   = "group-name"
    values = ["prod_ec2_bastion_host_security_group"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}