resource "aws_elasticache_subnet_group" "elasticachesg" {
  name       = "${var.subnet_group_name}"
  subnet_ids = "${var.subnet_ids}"
}