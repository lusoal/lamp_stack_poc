resource "aws_lb_target_group_attachment" "target_group" {
  target_group_arn = "${var.target_group_arn}"
  target_id        = "${var.target_id}"
  port             = "${var.port}"
}