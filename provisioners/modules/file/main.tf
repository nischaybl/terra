resource "null_resource" "file_copy" {
	connection {
		type = "ssh"
		user = var.ec2_user
		agent = false 
		host = "${var.instance_public_ip}"
		private_key = file("conf/terraform.pem")
	}
	
	provisioner "file" {
		source = "conf/test.txt"
		destination = "/home/ubuntu/terra_test.txt"
	}
}