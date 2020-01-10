variable "bucket" {
  description = "The Unique name of Bucket"
}

variable "acl" {
  description = "The kind of permissions on my bucket"
}

variable "aws_region" {
  default = "sa-east-1"
}

variable "tags" {
  type = "map"
}