resource "aws_lambda_permission" "allow_cloudwatch" {
  count         = var.trigger_arn == "" ? 0 : 1
  action        = "lambda:InvokeFunction"
  function_name = "${var.lambda_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${var.trigger_arn}}"
}

resource "aws_lambda_permission" "countable" {
  count         = length(var.array_trigger_arn)
  action        = "lambda:InvokeFunction"
  function_name = "${var.lambda_name}"
  principal     = "${var.principal}"
  source_arn    = var.array_trigger_arn[count.index]
}