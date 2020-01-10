variable "ami" {
  description = "Instance AMI"
}

variable "ec2_size" {
  description = "Instance size "
}

variable "subnet_id" {
  description = "Subnet Id"
}

variable "public_ip_address" {
  default = false
  description = "add public IP"
}

variable "key_pair" {
  description = "SSH key"
}

variable "role_name" {
  default = "ec2-role"
}

variable "security_groups" {}

variable "tags" {
  default = {
    Name = "ec2-terraform"
  }
}
