module "aws_ec2_creation" {
	source = "./modules/create_ec2"
	ec2_pem = var.ec2_pem
	ami_id = var.ami_id
}

module "aws_ec2_file_copy" {
	source = "./modules/file"
	ec2_user = var.ec2_user
	instance_public_ip = module.aws_ec2_creation.instance_public_ip
}

module "aws_ec2_remote_exec" {
	source = "./modules/remote-exec"
	ec2_user = var.ec2_user
	instance_public_ip = module.aws_ec2_creation.instance_public_ip
}