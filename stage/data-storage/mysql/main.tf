terraform {
   backend "s3" {
    # Replace this with your bucket name!
    bucket         = "mttmm-terraform"
    key            = "stage/data-storage/mysql/terraform.tfstate"
    region         = "us-east-2"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}
resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = "example_database"
  username            = "admin"
  password            = "password"
  skip_final_snapshot = true
}

output "address" {
  value       = aws_db_instance.example.address
  description = "Connect to the database at this endpoint"
}
output "port" {
  value       = aws_db_instance.example.port
  description = "The port the database is listening on"
}