resource "aws_lb" "test" {
  name               = "dor2-aws-1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.a.id, aws_subnet.b.id]

  enable_deletion_protection = false

  tags = {
    Name      = "dor2-aws-1-alb"
    Group     = "computing"
    Terraform = true
  }
}
