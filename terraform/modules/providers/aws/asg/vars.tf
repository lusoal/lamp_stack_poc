variable "asg_name" {}

variable "max_size" {
  default = "1"
}

variable "min_size" {
  default = "1"
}

variable "health_check_grace_period" {
  default = 300
}

variable "desired_capacity" {
  default = "1"
}

variable "lc_name" {}

variable "subnets_id" {
  type = "list"
}

variable "tag_name" {}

variable "tag_team" {}

variable "load_balancer" {
  type    = "list"
  default = []
}

variable "health_check_type" {}

variable "associate_elb" {}

variable "target_group_arns" {
  default = []
}
