data "aws_acm_certificate" "cert-ssl" {
  domain      = "${var.cert_domain_name}"
  statuses    = ["ISSUED"]
  most_recent = true
}