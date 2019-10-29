/*
 * Terraform output variables for AWS.
 */
output "aws_instance_external_ip" {
  value = "${aws_eip.aws-ip.public_ip}"
}
output "aws_instance_internal_ip" {
  value = "${aws_instance.aws-vm.private_ip}"
}
output "aws_instance_internal_ip2" {
  value = "${aws_instance.aws-vm2.private_ip}"
}
