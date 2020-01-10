resource "aws_route53_zone" "private" {
  count = "${var.zone_type == "private" ? 1 : 0}"
  name  = "${var.name}"

  vpc {
    vpc_id = "${var.vpc_id}"
  }
}

resource "aws_route53_zone" "public" {
  count = "${var.zone_type == "public" ? 1 : 0}"
  name  = "${var.name}"
}
