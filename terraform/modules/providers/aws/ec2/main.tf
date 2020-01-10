resource "aws_instance" "default" {
  ami                         = "${var.ami}"
  instance_type               = "${var.ec2_size}"
  subnet_id                   = "${var.subnet_id}"
  key_name                    = "${var.key_pair}"
  vpc_security_group_ids      = ["${var.security_groups}"]
  associate_public_ip_address = "${var.public_ip_address}"
  iam_instance_profile        = "${var.role_name}"

  root_block_device {
    delete_on_termination = true
  }

  tags  = "${var.tags}"

  lifecycle {
    create_before_destroy = true
  }
}
