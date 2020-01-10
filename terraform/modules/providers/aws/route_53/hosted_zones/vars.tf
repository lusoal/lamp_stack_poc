variable "name" {
  description = "name of hosted zone"
}

variable "zone_type" {
  description = "type of hosted zone"
}

variable "vpc_id" {
  default     = ""
  description = "Only necessary if is private hosted zone"
}


