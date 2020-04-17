data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    # Replace this with your bucket name!
    bucket = "mttmm-terraform"
    key    = "stage/data-storage/mysql/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

module "webserver" {
  source        = "..\\..\\..\\modules\\service\\webserver"
  cluster_name  = "test-cluster"
  instance_type = "t3.micro"
  min_size      = 1
  max_size      = 2

}
