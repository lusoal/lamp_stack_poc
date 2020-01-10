resource "aws_cloudwatch_event_rule" "console" {
  count = "${var.schedule_expression}" == "" ? 0 : 1
  name = "${var.name}"
  schedule_expression = "${var.schedule_expression}"
}

resource "aws_cloudwatch_event_rule" "countable" {
  count = length(var.expressions)
  name = "${var.name}-${count.index}"
  schedule_expression = var.expressions[count.index]
}