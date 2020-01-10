output "parameter_group_name" {
  value = "${tostring(var.cluster_mode) == "no" ? element(concat(aws_elasticache_parameter_group.elasticache_parameter_group_cluster_no.*.name,  list("")), 0) : element(concat(aws_elasticache_parameter_group.elasticache_parameter_group_cluster_yes.*.name,  list("")), 0)}"
}