variable "vpc_name" {
  default = "vpc-projeto"
}

variable "cert_name" {
  default = "lucasduarte.club"
}

variable "sg_name" {
  default = "ALB-sg-wordpress"
}

variable "ips_sg_list" {
  default = ["0.0.0.0/0"]
}

variable "ec2_name" {
  default = "wordpress-site-poc"
}

variable "internal" {
  default = false
}

variable "target_group_port" {
  default = 80
}

variable "target_group_health_path" {
  default = ""
}

variable "target_group_matcher" {
  default = 200
}

variable "lc_name" {
  default = "lc-wordpress-site"
}

variable "ami_id" {
  default = "ami-08be6b6db0206a7c7" #Generated with Packer, Get AMI ID based on name
}

variable "instance_type" {
  default = "m5.large"
}

variable "role_name" {
  default = ""
}

variable "key_pair" {
  default = "wordpress-poc"
}

variable "tags" {
  default = {
    Name = "ALB-WORDPRESS-POC"
  }
}

variable "asg_name" {
  default = "wordpress-sg"
}

variable "asg_max_size" {
  default = 10
}

variable "asg_min_size" {
  default = 2
}

variable "desired_capacity" {
  default = 2
}

variable "team" {
  default = "teste"
}

variable "zone_id" {
  default = "Z21NECZDPTEFWT"
}

variable "record_name" {
  default = "wordpress.lucasduarte.club"
}
