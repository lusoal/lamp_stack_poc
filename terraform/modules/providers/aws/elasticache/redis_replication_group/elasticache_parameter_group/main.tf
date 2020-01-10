resource "aws_elasticache_parameter_group" "elasticache_parameter_group_cluster_no" {
  count  = "${tostring(var.cluster_mode) == "no" ? 1 : 0}"
  name   = "${var.parameter_group_name}"
  family = "${var.family}"
  parameter {
      name  = "cluster-enabled"
      value = "no"
    }
}

resource "aws_elasticache_parameter_group" "elasticache_parameter_group_cluster_yes" {
  count  = "${tostring(var.cluster_mode) == "yes" ? 1 : 0}"
  name   = "${var.parameter_group_name}"
  family = "${var.family}"
  parameter {
      name  = "cluster-enabled"
      value = "yes"
    }
}