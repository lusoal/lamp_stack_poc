resource "aws_s3_bucket_policy" "a" {
  bucket = "${var.bucket}"
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "2",
        "Effect": "Allow",
        "Principal": {
            "AWS": "${var.cloudfront_arn}"
        },
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${var.bucket}/*"
      }
    ]
}
POLICY
}