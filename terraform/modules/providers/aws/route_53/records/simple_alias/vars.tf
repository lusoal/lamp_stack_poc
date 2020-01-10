variable "zone_id" {}

variable "name" {
  default = ""
}

variable "type" {
  default = "A"
}

variable "alias_name" {
  description = "DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone."
}


variable "alias_zone_id" {
  description = "Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone. See resource_elb.zone_id for example."
}

variable "evaluate_target_health" {
  default     = true
  description = "Set to true if you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set"
}
