resource "aws_lb" "lb_internal" {
  count                      = "${tobool(var.internal) == true ? 1 : 0}"
  name                       = "${var.name}"
  internal                   = "${var.internal}"
  load_balancer_type         = "${var.load_balancer_type}"
  security_groups            = "${var.security_groups}"
  subnets                    = "${var.internal_subnets}"
  enable_deletion_protection = "${var.enable_deletion_protection}"
  idle_timeout               = "${var.idle_timeout}"
  tags                       = "${var.tags}"
}

resource "aws_lb" "lb_external" {
  count                      = "${tobool(var.internal) == false ? 1 : 0}"
  name                       = "${var.name}"
  internal                   = "${var.internal}"
  load_balancer_type         = "${var.load_balancer_type}"
  security_groups            = "${var.security_groups}"
  subnets                    = "${var.external_subnets}"
  enable_deletion_protection = "${var.enable_deletion_protection}"
  idle_timeout               = "${var.idle_timeout}"
  tags                       = "${var.tags}"
}
