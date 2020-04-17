provider "aws" {
  region = "us-east-2"
}

module "webserver" {
  source = "..\\modules\\services\\webserver-cluster"
}