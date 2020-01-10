provider "aws" {
  region = "${module.environment.aws_region}"
}

terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "bucket-nginx-test"
    key     = "environments/providers/aws/prd/wordpres-stack/main.tf"
    encrypt = true
  }
}

//Import the constants
module "environment" {
  source = "../"
}

module "aws_security_group_lb" {
  source  = "../../../../../modules/providers/aws/security_group/create_sg"
  sg_name = "${var.sg_name}"
  vpc_id  = "${data.aws_vpc.vpc.id}"
}

module "sg_rules_https" {
  source            = "../../../../../modules/providers/aws/security_group/create_sg_rule"
  port              = 443
  protocol          = "TCP"
  ips_sg_list       = "${var.ips_sg_list}"
  security_group_id = "${module.aws_security_group_lb.id}"
}

module "application_loadbalancer" {
  source           = "../../../../../modules/providers/aws/alb/aws_lb"
  name             = "elb-${var.ec2_name}"
  internal         = "${var.internal}"
  security_groups  = ["${module.aws_security_group_lb.id}"]
  internal_subnets = [""]
  external_subnets = "${module.environment.public_subnets}"
  tags             = "${var.tags}"
}

module "target_group" {
  source  = "../../../../../modules/providers/aws/alb/aws_lb_target_group"
  name    = "tg-${var.ec2_name}"
  port    = "${var.target_group_port}"
  vpc_id  = "${data.aws_vpc.vpc.id}"
  path    = "${var.target_group_health_path}"
  matcher = "${var.target_group_matcher}"
}

module "loadbalancer_lister_https" {
  source            = "../../../../../modules/providers/aws/alb/aws_lb_listener"
  load_balancer_arn = "${module.application_loadbalancer.alb_arn}"
  target_group_arn  = "${module.target_group.alb_tg_arn}"
  port              = 443
  protocol          = "HTTPS"
  ssl_certificate   = true
  certificate_arn   = "${data.aws_acm_certificate.acm_certificate.arn}"
}

module "aws_launch_configuration" {
  source          = "../../../../../modules/providers/aws/launch_config"
  lc_name         = "${var.lc_name}"
  ami_id          = "${var.ami_id}"
  instance_type   = "${var.instance_type}"
  path_user_data  = "./user_data.sh"
  security_groups = "${module.security_group.id}"
  iam_role        = "${var.role_name}"
  key_name        = "${var.key_pair}"
}

module "aws_autoscaling_group_tg" {
  source                    = "../../../../../modules/providers/aws/asg"
  asg_name                  = "${var.asg_name}"
  associate_elb             = "TG"
  max_size                  = "${var.asg_max_size}"
  min_size                  = "${var.asg_min_size}"
  desired_capacity          = "${var.desired_capacity}"
  health_check_grace_period = ""
  health_check_type         = "ELB"
  lc_name                   = "${module.aws_launch_configuration.lc_name}"
  subnets_id                = "${module.environment.private_subnets}"
  target_group_arns         = ["${module.target_group.alb_tg_arn}"]
  tag_name                  = "${var.asg_name}"
  tag_team                  = "${var.team}"
}


module "security_group" {
  source  = "../../../../../modules/providers/aws/security_group/create_sg"
  sg_name = "wordpress-poc-sg"
  vpc_id  = "${data.aws_vpc.vpc.id}"
}

module "add_sg_rule" {
  source            = "../../../../../modules/providers/aws/security_group/create_sg_rule"
  port              = "${var.target_group_port}"
  ips_sg_list       = ["10.0.0.0/16"]
  security_group_id = "${module.security_group.id}"
}

module "cloudfront" {
  source           = "../../../../../modules/providers/aws/cloudfront/cloudfront_distribution_elb"
  app_name         = "${var.ec2_name}"
  cert_domain_name = "*.${var.cert_name}"
  origin_dns_name  = "${module.application_loadbalancer.dns_name}"
  cnames           = ["${var.record_name}"]
}

module "route_53_record" {
  source        = "../../../../../modules/providers/aws/route_53/records/simple_alias"
  zone_id       = "${var.zone_id}"
  name          = "${var.record_name}"
  alias_name    = "${module.cloudfront.cloudfront_dns}"
  alias_zone_id = "${module.cloudfront.hosted_zone_id}"
}
