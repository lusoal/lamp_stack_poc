data "aws_vpc" "vpc" {
  tags = {
    Name = "${var.vpc_name}"
  }
}


data "aws_acm_certificate" "acm_certificate" {
  domain      = "*.${var.cert_name}"
  statuses    = ["ISSUED"]
  most_recent = true
}