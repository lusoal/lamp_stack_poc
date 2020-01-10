variable "zone_id" {}

variable "name" {}

variable "type" {
  default = "CNAME"
}

variable "ttl" {
  default = 60
}

variable "weight" {
  default = 100
}

variable "identifier" {
  description = "Description of this record set that is unique within the group of weighted sets."
  default     = ""
}

variable "records" {
  description = "The domain name that you want to resolve to instead of the value in the Name field."
}
