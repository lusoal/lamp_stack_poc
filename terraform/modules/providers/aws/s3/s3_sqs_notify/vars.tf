variable "bucket" {
  description = "The Unique name of Bucket"
}

variable "acl" {
  description = "The kind of permissions on my bucket"
}

variable "queue_arn" {
  description = "Teh ARN of the SQS Queue"
}

variable "events" {
  type        = "list"
  description = "The kind of event to trigger the notification - s3:ObjectCreated:*"
}

variable "filter_suffix" {
  default     = ""
  description = "If you want to filter the objects created in s3"
}
