resource "aws_cloudwatch_event_target" "lambda" {
  count = var.rule == "" ? 0 : 1
  rule = "${var.rule}"
  arn = "${var.arn}"
  input = "${var.input}"
}

resource "aws_cloudwatch_event_target" "countable" {
  count = length(var.rules)
  rule = var.rules[count.index]
  arn = "${var.arn}"
  input = var.inputs[count.index]
}
