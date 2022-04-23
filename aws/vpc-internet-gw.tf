resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "dor2-aws-1-internet-gw"
    Group     = "networking"
    Terraform = true
  }
}
