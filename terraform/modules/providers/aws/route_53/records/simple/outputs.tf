output "aws_route53_record" {
  value = "${aws_route53_record.simple.*.id}"
}

output "aws_route53_fqdn" {
  value = "${aws_route53_record.simple.*.fqdn}"
}
