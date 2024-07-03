data "aws_security_group" "prod_lb_security_group" {
  filter {
    name   = "group-name"
    values = ["prod_lb_security_group"]
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_security_group" "prod_eks_security_group" {
  filter {
    name   = "group-name"
    values = ["prod_eks_security_group"]
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}