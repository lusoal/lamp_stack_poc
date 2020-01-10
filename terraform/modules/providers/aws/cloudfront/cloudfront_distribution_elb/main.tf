# Cloudfront
resource "aws_cloudfront_distribution" "cloudfront" {
  origin {
    domain_name = "${var.origin_dns_name}"
    origin_id   = "${var.app_name}-origin"

    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_protocol_policy   = "${var.origin_protocol_policy}"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2", "SSLv3"]
      origin_keepalive_timeout = 60
      origin_read_timeout      = 60
    }
  }

  web_acl_id          = "${var.web_acl_id}"
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.app_name}"
  default_root_object = "${var.default_root_object}"

  lifecycle {
    prevent_destroy = false
  }

  aliases = "${var.cnames}"

  # Cloudfront Default Cache Behavior
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.app_name}-origin"
    compress         = true

    forwarded_values {
      query_string = true
      headers      = ["CloudFront-Forwarded-Proto", "Content-Location", "Host", "Location", "Origin", "Referer", "CloudFront-Is-Mobile-Viewer", "CloudFront-Is-Desktop-Viewer"]

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Cloudfront Custom Cache Behavior
  ordered_cache_behavior {
    path_pattern     = "media/*"
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.app_name}-origin"
    compress         = true

    forwarded_values {
      query_string = true
      headers      = ["CloudFront-Forwarded-Proto", "Content-Location", "Host", "Location", "Origin", "Referer"]

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  ordered_cache_behavior {
    path_pattern     = "skin/*"
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.app_name}-origin"
    compress         = true

    forwarded_values {
      query_string = true
      headers      = ["CloudFront-Forwarded-Proto", "Content-Location", "Host", "Location", "Origin", "Referer"]

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  ordered_cache_behavior {
    path_pattern     = "js/*"
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.app_name}-origin"
    compress         = true

    forwarded_values {
      query_string = true
      headers      = ["CloudFront-Forwarded-Proto", "Content-Location", "Host", "Location", "Origin", "Referer"]

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  tags = {
    Name = "${var.app_name}"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = "${data.aws_acm_certificate.cert-ssl.arn}"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "${var.minimum_tls}"
  }

}
