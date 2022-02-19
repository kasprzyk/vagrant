# ami-0015a39e4b7c0966f  - Ubuntu

provider "aws" {
  region = "eu-west-1"
}

locals {
  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH0+vAcVmJvxPMhetaKGwSKghOYhBgscgn6fmANue0Vb runner"
  #  a = "a"
  #  b = "b"
  #  c = "${local.a} + ${local.b}"
}

resource "aws_key_pair" "my_key_pair" {
  public_key = local.ssh_public_key
  key_name_prefix = "kuba"
}

resource "aws_instance" "first" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.my_key_pair.key_name

  subnet_id = module.vpc.public_subnets[0]

  vpc_security_group_ids = [aws_security_group.all_access.id]

  tags = {
    Name = "maszyna-kuby"
  }
}

resource "aws_instance" "second" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.my_key_pair.key_name

  subnet_id = module.vpc.private_subnets[0]

  vpc_security_group_ids = [aws_security_group.all_access.id]

  tags = {
    Name = "maszyna-kuby-prv"
  }
}

resource "aws_security_group" "all_access" {
  name_prefix = "kuba"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 0
    protocol  = "ALL"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol  = "ALL"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name = "example-kuba"
  cidr = "10.11.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.11.1.0/24", "10.11.2.0/24", "10.11.3.0/24"]
  public_subnets  = ["10.11.101.0/24", "10.11.102.0/24", "10.11.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
  }
}