resource "aws_iam_policy" "not_rendered" {
  name        = "${var.name}"
  description = "Managed by Terraform - ${var.description}"
  policy      = "${var.policy}"
  path        = "${var.path}"
}
