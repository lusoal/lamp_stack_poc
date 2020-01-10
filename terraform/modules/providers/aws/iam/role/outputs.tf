output "instance_profile_name" {
  value = "${aws_iam_instance_profile.default.name}"
}

output "arn" {
  value = "${aws_iam_role.default.arn}"
}

output "role_arn" {
value = "${aws_iam_instance_profile.default.arn}"
}