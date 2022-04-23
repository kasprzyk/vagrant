resource "aws_subnet" "prv-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "dor2-aws-1-prv-a"
    Group     = "networking"
    Terraform = true
  }
}

resource "aws_subnet" "prv-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "dor2-aws-1-prv-b"
    Group     = "networking"
    Terraform = true
  }
}
