terraform {
  required_version = "~> 1.1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

data "local_file" "ssh_key" {
  filename = "/home/vagrant/.ssh/id_ed25519.pub"
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-aws-key-karol"
  public_key = data.local_file.ssh_key.content
  tags = var.tags
}

module "vpc" {
  source = "../module-projekt-vpc"
}

/*module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name = "projekt-karol"
  cidr = "10.11.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b"]
  private_subnets = ["10.11.1.0/24", "10.11.2.0/24"]
  public_subnets  = ["10.11.101.0/24", "10.11.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
  }
}*/

module "instance_1" {
  source = "../module-projekt-ec2"

  key_pair_name = aws_key_pair.my_key_pair.key_name
  subnet_id = module.vpc.public_subnets[1]
  vpc_id = module.vpc.vpc_id
}

module "instance_2" {
  source = "../module-projekt-ec2"
  
  key_pair_name = aws_key_pair.my_key_pair.key_name
  subnet_id = module.vpc.public_subnets[0]
  vpc_id = module.vpc.vpc_id
}