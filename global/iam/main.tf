terraform {
  backend "s3" {
    bucket         = "mttmm-terraform"
    key            = "iam/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}

/* This is legacy. Follow the uncommented example below

resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

*/

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names) # toset is used to convert the var.user_names list into a set
  name     = each.value
}
