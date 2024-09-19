resource "aws_elb" "elb" {

  listener {
    instance_port     = "80"
    instance_protocol = "HTTP"
    lb_port           = "80"
    lb_protocol       = "HTTP"
  }
  availability_zones        = ["ap-south-1a", "ap-south-1b"]
  cross_zone_load_balancing = true
}
