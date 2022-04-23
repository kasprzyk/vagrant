resource "aws_instance" "prv-a" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.prv-a.id
  key_name      = aws_key_pair.key.key_name

  vpc_security_group_ids      = [aws_security_group.prv.id]
  associate_public_ip_address = false

  user_data = <<-EOT
#!/bin/bash
sudo apt-get update
sudo apt-get -y install apache2
  EOT

  tags = {
    Name      = "dor2-aws-1-ec2-prv-a"
    Group     = "compute"
    Terraform = true
  }
}
