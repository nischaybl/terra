resource "null_resource" "file_copy" {
	connection {
		type = "ssh"
		user = var.ec2_user
		agent = false 
		host = "${var.instance_public_ip}"
		private_key = file("conf/terraform.pem")
	}
	
	provisioner "remote-exec" {
		inline = [ 
			"sudo apt update -y",
			"sudo apt install git -y",
			"sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y",
			"curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
			"echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
			"sudo apt-get update -y",
			"sudo apt-get install docker-ce docker-ce-cli containerd.io -y",
			"echo Docker is Installed successfully"
		]
	}
}