variable "domain_name" {}

variable "origin_id" {}

variable "origin_access_identity" {}


variable "acm_certificate_arn" {}

variable "ssl_certs_details" {
  default = {}
}

variable "aliases" {
  type = "list"
}

variable "tags" {
  type = "map"
}