resource "aws_elasticache_parameter_group" "elasticache_parameter_group_redis" {
  name   = "${var.parameter_group_name}"
  family = "${var.family}"
  parameter {
      name  = "cluster-enabled"
      value = "no"
    }
}