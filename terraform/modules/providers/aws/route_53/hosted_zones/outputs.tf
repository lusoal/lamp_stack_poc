output "zone_id" {
  value = "${var.zone_type == "public" ? element(aws_route53_zone.public.*.zone_id, 0) :
  element(concat(aws_route53_zone.public.*.zone_id, list("")), 0)}"
}

output "name_servers" {
  value = "${var.zone_type == "public" ? element(aws_route53_zone.public.*.name_servers, 0) :
  element(concat(aws_route53_zone.public.*.name_servers, list("")), 0)}"
}
