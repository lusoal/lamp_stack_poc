resource "aws_s3_bucket" "default_bucket" {
  bucket = "${var.bucket}"
  acl    = "${var.acl}"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${aws_s3_bucket.default_bucket.id}"

  queue {
    queue_arn     = "${var.queue_arn}"
    events        = "${var.events}"
    filter_suffix = "${var.filter_suffix}"
  }

  depends_on = ["aws_s3_bucket.default_bucket"]
}
