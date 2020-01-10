output "arn" {
  value = "${aws_s3_bucket.default_bucket.arn}"
}

output "s3_origin_id" {
  value = "${aws_s3_bucket.default_bucket.id}"
}

output "bucket_domain_name" {
  value = "${aws_s3_bucket.default_bucket.bucket_domain_name}"
}
