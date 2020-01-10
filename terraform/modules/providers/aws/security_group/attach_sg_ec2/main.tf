resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = "${var.sg_id}"
  network_interface_id = "${var.primary_network_interface_id}"
}
