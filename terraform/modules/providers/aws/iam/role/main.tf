resource "aws_iam_role" "default" {
  name               = "${var.name}"
  assume_role_policy = "${data.template_file.role.rendered}"
  tags               = "${var.tags}"
}

data "template_file" "role" {
  template = "${file("${var.path_role}")}"
}

resource "aws_iam_policy_attachment" "default" {
  name       = "${var.attachment_name}"
  roles      = ["${aws_iam_role.default.name}"]
  policy_arn = "${var.policy_arn}"
}

resource "aws_iam_instance_profile" "default" {
  name = "${var.instance_profile_name}"
  role = "${aws_iam_role.default.name}"
}
