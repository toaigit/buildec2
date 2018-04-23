resource "aws_eip" "my_eip" {
  vpc      = true
  lifecycle {
    prevent_destroy = false
  }
}
output "myeip_output" {
   value = "${aws_eip.my_eip.id}"
}

output "myeip_iaddr_output" {
  value = "${aws_eip.my_eip.public_ip}"
}
