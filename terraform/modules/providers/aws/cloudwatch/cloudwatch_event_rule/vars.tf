variable "schedule_expression" {
  description = "Schedule expression"
  default = ""
}

variable "expressions" {
  description = "Schedule expression"
  type = list(string)
  default = []
}

variable "name" {
  description = "Cron name"
}
