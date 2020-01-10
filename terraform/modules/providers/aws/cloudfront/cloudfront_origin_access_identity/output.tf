output "cloudfront_origin_access_identity_output" {
  value = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
}

output "cloudfront_origin_access_arn_output" {
  value = "${aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn}"
}