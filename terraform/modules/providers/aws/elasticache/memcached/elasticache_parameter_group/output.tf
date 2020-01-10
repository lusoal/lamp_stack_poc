output "parameter_group_name" {
  value = "${aws_elasticache_parameter_group.elasticache_parameter_group_memcached.name}"
}