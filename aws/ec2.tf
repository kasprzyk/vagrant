resource "aws_instance" "proxy" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.a.id
  key_name      = aws_key_pair.key.key_name

  vpc_security_group_ids      = [aws_security_group.proxy.id]
  associate_public_ip_address = true

  tags = {
    Name      = "dor2-aws-1-ec2-proxy"
    Group     = "compute"
    Terraform = true
  }
}
