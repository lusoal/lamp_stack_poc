######### Variáveis do Recurso Elasticache_Cluster ############

variable "cluster_id" {
  description = "Nome do Cluster"
}

variable "engine" {
  description = "Ferramenta memcached ou redis"
}

variable "engine_version" {
  description = "Versão do Memcached ou Redis"
}

variable "node_type" {
  description = "Size do nós"
}

variable "num_cache_nodes" {
  description = "2"
}

variable "parameter_group_name" {
  description = "Nome do parameter group"
}


variable "subnet_group_name" {
  description = "Subnet Group Name"
}

variable "security_group_ids" {
  type = "list"
}

variable "snapshot_window" {
  description = "00:00-01:00"
}

variable "snapshot_retention_limit" {
  description = "7"
}

variable "automatic_failover_enabled" {
  default = true
}

variable "replication_group_id" {
  description = "redis-rep-group-1"
}

variable "replication_group_description" {
  description = "redis-rep-group"
}

variable "node_type_rep" {
  default = "cache.t2.micro"
}

variable "number_cache_clusters" {
  description = 2
}

variable "parameter_group_name_rep" {
  description = "Nome do parameter group"
}

variable "maintenance_window" {
  description = "sun:01:00-sun:03:00"
}

variable "cluster_mode" {
  description = "false"
}

variable "replicas_per_node_group" {
  description = "1"
}

variable "num_node_groups" {
  description = "1"
}

variable "tags" {
  type = "map"
}