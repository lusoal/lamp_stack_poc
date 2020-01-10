resource "aws_elasticache_cluster" "elasticache_memcached" {
  cluster_id           = "${var.cluster_id}"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  node_type            = "${var.node_type}"
  num_cache_nodes      = "${var.num_cache_nodes}"
  parameter_group_name = "${var.parameter_group_name}"
  port                 = "11211"
  subnet_group_name    = "${var.subnet_group_name}"
  security_group_ids   = "${var.security_group_ids}"
  az_mode              = "${var.num_cache_nodes != "1" ? "cross-az" : "single-az"}"
  maintenance_window   = "${var.maintenance_window}"
  tags                 = "${var.tags}"
}
