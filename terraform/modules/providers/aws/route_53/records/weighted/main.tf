resource "aws_route53_record" "weighted" {
  zone_id = "${var.zone_id}"
  name    = "${var.name}"
  type    = "${var.type}"
  ttl     = "${var.ttl}"

  weighted_routing_policy {
    weight = "${var.weight}"
  }

  set_identifier = "${var.identifier}"
  records        = ["${var.records}"]
}