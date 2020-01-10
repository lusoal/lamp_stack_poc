output "aws_route53_record" {
  value = "${aws_route53_record.simple_alias.id}"
}
