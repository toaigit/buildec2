variable "region" {
  default = "us-west-2"
  }

variable "asg_prefix" {
  default = "ASGec2"
}

variable "lc_prefix" {
  default = "LCec2"
}

variable "subnets-count" {
  default = "3"
}

variable "iamrole" {
  default = "StanfordUpdateDNS"
}

variable "subnet1" {
  default = "subnet-caade283"
}
variable "zoneA" {
  default = "subnet-caade283"
}

variable "subnet2" {
  default = "subnet-d47740b3"
}
variable "zoneB" {
  default = "subnet-d47740b3"
}

variable "subnet3" {
  default = "subnet-a78150fc"
}
variable "zoneC" {
  default = "subnet-a78150fc"
}

variable "subnets" {
  default = ["subnet-caade283","subnet-d47740b3","subnet-a78150fc"]
}
variable "min_size" {
  default = "1"
}

variable "max_size" {
  default = "1"
}

variable "asg_desired" {
  default = "1"
}

variable "health_check_grace_period" {
  default = "300"
}

variable "oel74-20180419-with-asp" {
  default = "ami-ee462896"
}

variable "instance_type" {
  default = "t2.small"
}

variable "key_name" {
  default = "cia-toai"
}

variable "sgAll" {
  default = "sg-d58db8ae"
}

variable "volume_type" {
  default = "gp2"
}

variable "volume_size" {
  default = "20"
}

variable "host_name" {
  default = "buildec2"
  }

variable "local_domain_name" {
  default = "amazon.stanford.edu"
  }

variable "external_domain_name" {
  default = "stanford.edu"
  }

variable "delete_on_termination" {
  default = "true"
}

variable "nfs_share_volume" {
  default = "fs-8a588b23.efs.us-west-2.amazonaws.com:/"
}

variable "rundir" {
  default = "/share/awsconfig/centos"
}
