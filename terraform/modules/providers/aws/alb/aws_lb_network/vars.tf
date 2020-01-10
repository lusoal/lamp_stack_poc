variable "name" {}

variable "internal" {
  default = true
}

variable "load_balancer_type" {
  default = "network"
}

variable "internal_subnets" {
  type = "list"
}

variable "external_subnets" {
  type = "list"
}

variable "enable_deletion_protection" {
  default = false
}

variable "idle_timeout" {
  default = 60
}

variable "weight" {
  default = 0
}

variable "identifier" {
  description = "Used only on weighted records, leave \"\" if not weighted"
  default     = ""
}

variable "tags" {
  default = {}
  type = "map"
}