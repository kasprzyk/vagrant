resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "Target not found"
      status_code  = "404"
    }
  }
}
