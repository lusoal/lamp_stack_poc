resource "aws_route53_record" "simple" {
  count   = length(var.resource_count)
  zone_id = "${var.zone_id}"
  name    = var.resource_count[count.index].name
  type    = var.resource_count[count.index].type
  ttl     = var.resource_count[count.index].ttl
  records = var.resource_count[count.index].zone_records
}

