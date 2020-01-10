resource "aws_iam_role" "default" {
  name               = "${var.name}"
  description        = "${var.description}"
  assume_role_policy = "${var.assume_role_policy}"
  tags               = "${var.tags}"
}

