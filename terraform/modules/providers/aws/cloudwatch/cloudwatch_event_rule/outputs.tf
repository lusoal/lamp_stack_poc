output "cloudwatch_event_rule" {
  value = "${aws_cloudwatch_event_rule.countable[*].name}"
}

output "cloudwatch_event_arn" {
  value = "${aws_cloudwatch_event_rule.countable[*].arn}"
}
