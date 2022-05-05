terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "prod"
  alias   = "prod"
}

provider "aws" {
  region  = "us-west-2"
  profile = "staging"
  alias   = "staging"
}
