variable "environment" {
  default = "PRD"
}

variable "app_name" {
  default = "bisws"
}

variable "cert_domain_name" {
  default = "*.bisws.com.br"
}

variable "origin_dns_name" {
  default = ""
}

variable "cnames" {
  type    = "list"
  default = ["bisws.com.br", "*.bisws.com.br"]
}

variable "minimum_tls" {
  default = "TLSv1.1_2016"
}

variable "web_acl_id" {
  description = "(Optional) - Web ACL ID that can be attached to the Cloudfront distribution"
  default     = ""
}

variable "origin_protocol_policy" {
  default     = "https-only"
  description = "The way of Cloudfront comunicate with his origin"
}

variable "default_root_object" {
  default = ""
}
