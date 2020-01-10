output "weighted_record_arn" {
  value = "${element(concat(aws_route53_record.weighted.*.id, list("")), 0)}"
}

output "simple_record_arn" {
  value = "${element(concat(aws_route53_record.simple.*.id, list("")), 0)}"
}
