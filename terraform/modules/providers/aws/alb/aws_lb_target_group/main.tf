resource "aws_lb_target_group" "tg" {
  count    = "${tostring(var.protocol) == "HTTP" ? 1 : 0}"
  name     = "${var.name}"
  port     = "${var.port}"
  protocol = "${var.protocol}"
  vpc_id   = "${var.vpc_id}"
  tags     = "${var.tags}"

  health_check {
    interval            = "${var.health_check_interval}"
    protocol            = "${var.protocol}"
    path                = "/${var.path}"
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.health_check_timeout}"
    matcher             = "${var.matcher}"
  }
}

resource "aws_lb_target_group" "tg_tcp" {
  count    = "${tostring(var.protocol) == "TCP" ? 1 : 0}"
  name     = "${var.name}"
  port     = "${var.port}"
  protocol = "${var.protocol}"
  vpc_id   = "${var.vpc_id}"
  tags     = "${var.tags}"

  health_check {
    protocol            = "${var.protocol}"
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
  }
}
