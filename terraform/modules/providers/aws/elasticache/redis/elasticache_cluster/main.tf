resource "aws_elasticache_cluster" "elasticache_redis" {
  cluster_id               = "${var.cluster_id}"
  engine                   = "redis"
  engine_version           = "${var.engine_version}"
  node_type                = "${var.node_type}"
  num_cache_nodes          = "${var.num_cache_nodes}"
  parameter_group_name     = "${var.parameter_group_name}"
  port                     = "6379"
  subnet_group_name        = "${var.subnet_group_name}"
  security_group_ids       = "${var.security_group_ids}"
  snapshot_window          = "${var.snapshot_window}"
  snapshot_retention_limit = "${var.snapshot_retention_limit}"
  maintenance_window       = "${var.maintenance_window}"
  tags                     = "${var.tags}"
}