######### Variáveis do Recurso Elasticache_Cluster_Parameter_Group ############

variable "parameter_group_name" {
  description = "cache-params"
}
variable "family" {
  description = "redis2.8"
}

variable "cluster_mode" {
  description = "no"
}