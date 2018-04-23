resource "aws_efs_file_system" "unanet" {
  creation_token = "unanet-apps"

  tags {
    Name = "${var.host_name}_unanet"
  }
}
resource "aws_efs_mount_target" "unanet" {
  count = "${var.subnets-count}"
  file_system_id = "${aws_efs_file_system.unanet.id}"
  subnet_id      = "${element(var.subnets, count.index)}"
  security_groups = ["${var.sgAll}"]
}


output "unanet_efs_output" {
  value = "${aws_efs_file_system.unanet.dns_name}"
}
