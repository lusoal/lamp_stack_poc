output "domain_name" {
  value = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
}

output "hosted_zone_id" {
  value = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
}