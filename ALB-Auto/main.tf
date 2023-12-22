resource "aws_lb" "lb-test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-security.id]
  subnets            = ["subnet-09385374b6399a68e", "subnet-0e6d1379f0508ff20"]

  enable_deletion_protection = false
  tags = {
    name = "test-lb"
  }
}

resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.my-tg.arn
}

resource "aws_lb_target_group" "my-tg" {
  name        = "target-grp"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "vpc-0d07fa11183ffea67"
}
resource "aws_security_group" "lb-security" {
  name        = "security-guard"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0d07fa11183ffea67"


  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg1"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb-test.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.my-tg.arn
    type             = "forward"
  }
}
