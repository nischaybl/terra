resource "aws_instance" "server" {
	ami = var.ami_id
	instance_type = "t2.micro"
	key_name = var.ec2_pem	
	vpc_security_group_ids = ["${aws_security_group.sg.id}"]
	tags = {
		Name = "provisioner"
	}
}

resource "aws_security_group" "sg" {
	name = "sg"
	description = "Allow ssh inbound traffic"
	
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

