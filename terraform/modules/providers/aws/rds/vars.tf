variable "allocated_storage" {}

variable "storage_type" {
  default = "gp2"
}

variable "engine" {
  default = "mysql"
}

variable "engine_version" {
  default = "5.7"
}

variable "params_engine_version" {
  default = "5.7"
  description = "Engine version of the paramter group of the DB instance"
}

variable "instance_class" {}

variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
}

variable "name" {
  description = "The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance."
}

variable "publicly_accessible" {
  default = false
}

variable "username" {}

variable "password" {}

variable "parameter_group_name" {
  default = "default.mysql5.7"
}

variable "availability_zone" {}

variable "db_subnet_group_name" {}

variable "multi_az" {
  default = false
}

variable "maintenance_window" {
  default = "Sat:01:01-Sat:02:01"
}

variable "backup_window" {
  default = "03:00-07:30"
}

variable "backup_retention_period" {
  default = 5
}

variable "workload_type" {
  default = "production"
}

variable "apply_immediately" {
  default = true
}

variable "cidr_vpc" {
  default = "10.13.0.0/16"
}

variable "rds_sg_id" {
}

variable "tags" {
  type = "map"
}
