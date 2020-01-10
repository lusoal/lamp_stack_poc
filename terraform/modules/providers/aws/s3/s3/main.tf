resource "aws_s3_bucket" "default_bucket" {
  bucket = "${var.bucket}"
  acl    = "${var.acl}"
  tags   = "${var.tags}"
}
