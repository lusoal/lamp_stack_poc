resource "aws_elasticache_replication_group" "elasticache_rg_redis_mode_no" {
  count                         = "${tostring(var.cluster_mode) == "no" ? 1 : 0}"
  automatic_failover_enabled    = "${var.automatic_failover_enabled}"
  replication_group_id          = "${var.replication_group_id}"
  replication_group_description = "${var.replication_group_description}"
  node_type                     = "${var.node_type_rep}"
  number_cache_clusters         = "${var.number_cache_clusters}"
  parameter_group_name          = "${var.parameter_group_name_rep}"
  subnet_group_name             = "${var.subnet_group_name}"
  security_group_ids            = "${var.security_group_ids}"
  port                          = "6379"
  snapshot_window               = "${var.snapshot_window}"
  snapshot_retention_limit      = "${var.snapshot_retention_limit}"
  maintenance_window            = "${var.maintenance_window}"
  tags                          = "${var.tags}"
}

resource "aws_elasticache_replication_group" "elasticache_rg_redis_mode_yes" {
  count                         = "${tostring(var.cluster_mode) == "yes" ? 1 : 0}"
  automatic_failover_enabled    = "true"
  replication_group_id          = "${var.replication_group_id}"
  replication_group_description = "${var.replication_group_description}"
  node_type                     = "${var.node_type_rep}"
  parameter_group_name          = "${var.parameter_group_name_rep}"
  subnet_group_name             = "${var.subnet_group_name}"
  security_group_ids            = "${var.security_group_ids}"
  port                          = "6379"
  snapshot_window               = "${var.snapshot_window}"
  snapshot_retention_limit      = "${var.snapshot_retention_limit}"
  maintenance_window            = "${var.maintenance_window}"
  tags                          = "${var.tags}"

  cluster_mode {
    num_node_groups         = "${var.num_node_groups}"         ###Number of shards
    replicas_per_node_group = "${var.replicas_per_node_group}" ###### Valor padrão é 1 nó + número de réplicas que é o passado na variável
  }
}
