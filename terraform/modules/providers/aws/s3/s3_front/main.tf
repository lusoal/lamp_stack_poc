resource "aws_s3_bucket" "default_bucket" {
  bucket = "${var.bucket}"
  acl    = "${var.acl}"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}