resource "aws_launch_template" "templ" {
  name_prefix   = "sh_ec2_launch_templ"
  image_id      = "ami-008fe2fc65df48dac"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["us-west-2a", "us-west-2b"]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1

  launch_template {
    id      = aws_launch_template.templ.id
    version = "$Latest"
  }
}