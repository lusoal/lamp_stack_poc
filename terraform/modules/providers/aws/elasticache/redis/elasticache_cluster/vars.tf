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
  description = "1"
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

variable "maintenance_window" {
  description = "sun:01:00-sun:03:00"
}

variable "tags" {
  type = "map"
}