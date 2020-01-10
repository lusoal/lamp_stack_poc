resource "aws_elasticache_parameter_group" "elasticache_parameter_group_cluster_no" {
  count  = "${tostring(var.cluster_mode) == "no" && tostring(var.family) != "memcached1.4" && tostring(var.family) != "memcached1.5" ? 1 : 0}"
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
############# Resource Group for Memcached #############
resource "aws_elasticache_parameter_group" "elasticache_parameter_group_memcached" {
  count  = "${tostring(var.family) == "memcached1.4" || tostring(var.family) == "memcached1.5" ? 1 : 0}"
  name   = "${var.parameter_group_name}"
  family = "${var.family}"
}
