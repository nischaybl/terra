output "ec2_public_ip" {
	value = "ssh -i \\\"terraform.pem\\\" ubuntu@${module.aws_ec2_creation.instance_public_ip}"

}