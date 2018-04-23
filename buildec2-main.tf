provider "aws" {
  region = "${var.region}"
}

data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.sh")}"
  vars {
    host_name = "${var.host_name}"
    local_domain_name = "${var.local_domain_name}"
    apps_vol = "${aws_ebs_volume.apps.id}"
    unanet_vol = "${aws_efs_file_system.unanet.dns_name}" 
    rundir = "${var.rundir}"
    nfs_share_volume = "${var.nfs_share_volume}"
    my_eip_id = "${aws_eip.my_eip.id}"
  }
}

resource "aws_autoscaling_group" "ServerGroup" {
  name_prefix               = "${var.asg_prefix}"
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
  desired_capacity          = "${var.asg_desired}"
  health_check_grace_period = "${var.health_check_grace_period}"
  vpc_zone_identifier       = ["${var.zoneA}"]
  launch_configuration      = "${aws_launch_configuration.LaunchConfig.name}"
  tag {
    key = "ASGName"
    value = "${var.host_name}"
    propagate_at_launch = true    
  }
  tag {
    key = "Name"
    value = "${var.host_name}"
    propagate_at_launch = true    
  }
  lifecycle {
    create_before_destroy = true
    }
}

resource "aws_launch_configuration" "LaunchConfig" {
  name_prefix                 = "${var.lc_prefix}"
  image_id                    = "${var.oel74-20180419-with-asp}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.sgAll}"]
  iam_instance_profile        = "${var.iamrole}"
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }
  lifecycle {
    create_before_destroy = true
  }
  user_data = "${data.template_file.userdata.rendered}"
}
