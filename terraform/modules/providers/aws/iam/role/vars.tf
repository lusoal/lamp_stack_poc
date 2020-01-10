variable "name" {}

variable "path_role" {}

variable "attachment_name" {}

variable "policy_arn" {}

variable "instance_profile_name" {}

variable "tags" {
  default = {}
  type = "map"
}
