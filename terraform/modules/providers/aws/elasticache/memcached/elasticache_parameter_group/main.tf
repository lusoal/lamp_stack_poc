############# Resource Group for Memcached #############
resource "aws_elasticache_parameter_group" "elasticache_parameter_group_memcached" {
  name   = "${var.parameter_group_name}"
  family = "${var.family}"
}
