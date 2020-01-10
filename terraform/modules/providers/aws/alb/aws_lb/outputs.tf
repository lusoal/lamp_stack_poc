output "alb_arn" {
  value = "${tobool(var.internal) == true ? element(concat(aws_lb.lb_internal.*.arn,  list("")), 0) : element(concat(aws_lb.lb_external.*.arn,  list("")), 0)}"
}

output "zone_id" {
  value = "${tobool(var.internal) == true ? element(concat(aws_lb.lb_internal.*.zone_id,  list("")), 0) : element(concat(aws_lb.lb_external.*.zone_id,  list("")), 0)}"
}

output "dns_name" {
  value = "${tobool(var.internal) == true ? element(concat(aws_lb.lb_internal.*.dns_name,  list("")), 0) : element(concat(aws_lb.lb_external.*.dns_name,  list("")), 0)}"
}
