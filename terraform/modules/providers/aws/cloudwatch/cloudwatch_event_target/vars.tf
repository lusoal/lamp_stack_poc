variable "rule" {
  description = "The Event Rule name"
  default = ""
}

variable "arn" {
  description = "The resource arn"
}

variable "input" {
  description = "Json input for event target"
  default = ""
}

variable "inputs" {
  description = "Json input for event target"
  type = list(string)
  default = []
}

variable "rules" {
  type = list(string)
  default = []
}