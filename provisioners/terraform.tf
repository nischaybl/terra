terraform {
	required_version = ">=0.12"
	
	required_providers {
    aws = {
      version = "= 3.55.0"
      source = "hashicorp/aws"
    }
  }	
  
   backend "s3" {
                bucket = "s3-test-backend-bucket-1111111"
                key = "provisioner/terraform.tfstate"
                region = "us-east-1"
                dynamodb_table = "backend_dynamoDB"
                encrypt = true
        }
}