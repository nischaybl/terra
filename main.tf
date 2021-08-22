resource "aws_instance" "my_instance" {
	ami = var.ami_id
	instance_type = var.instance_type
	count = 5 
	tags = {
		Name = "Terra-instance"
	}
}

