resource "aws_ebs_volume" "apps" {
    availability_zone = "us-west-2a"
    size = 24 
    type = "gp2"
    tags {
        Name = "${var.host_name}_apps"
    }
}

output "apps_volume_output" {
  value = "${aws_ebs_volume.apps.id}"
}
