variable "port" {}

variable "protocol" {
  default = "tcp"
}

variable "ips_sg_list" {
  type = "list"
}

variable "security_group_id" {}
