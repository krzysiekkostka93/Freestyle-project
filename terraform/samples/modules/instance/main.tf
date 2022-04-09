terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }
}

resource "aws_security_group" "this" {
  name = var.name
  vpc_id = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "ALL"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    protocol    = "ALL"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create VPC from ready-to-use module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "module-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Name   = "demo_dor3"
    Training = "dor3"
    Terraform   = "true"
  }
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = "t2.micro"

  key_name = var.key_pair_name

  subnet_id = module.vpc.public_subnets[0]

  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Name = var.name
  }
}