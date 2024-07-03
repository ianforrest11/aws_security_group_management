data "aws_security_group" "prod-lb-security-group" {
  filter {
    name   = "tag:Name"
    values = ["prod-lb-security-group"]
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_security_group" "prod-eks-security-group" {
  filter {
    name   = "tag:Name"
    values = ["prod-eks-security-group"]
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}