resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "dor2-aws-1"
    Group     = "networking"
    Terraform = true
  }
}
