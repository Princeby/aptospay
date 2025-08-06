terraform {
    backend "s3" {
      bucket = "aptospay-terraform-state"
      key = "state/terraform.tfstate"
      region = "eu-north-1"
      dynamodb_table = "terraform-locks"
    }
}