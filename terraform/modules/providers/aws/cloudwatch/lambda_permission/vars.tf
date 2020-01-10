variable "lambda_name" {
  description = "Lambda function name"
}
variable "array_trigger_arn" {
  type = list(string)
  default = []
}

variable "trigger_arn" {
  description = "This ensures that only events generated from the specified bucket or rule can invoke the function."
  default = ""
}

variable "principal" {
  description = "Event to be trigged: Lambda: events.amazonaws.com, SNS: sns.amazonaws.com"
}