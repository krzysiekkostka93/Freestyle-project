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

resource "aws_instance" "first" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.my_key_pair.key_name

  subnet_id = module.vpc.public_subnets[0]

  vpc_security_group_ids = [aws_security_group.all_access.id]

  tags = var.tags
}

resource "aws_instance" "second" {
  count = var.create_second_instance ? 1 : 0 #Warunkowe tworzenie resource
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.my_key_pair.key_name

  subnet_id = module.vpc.public_subnets[1]

  vpc_security_group_ids = [aws_security_group.all_access.id]

  tags = var.tags
}

resource "aws_security_group" "all_access" {
  name_prefix = "karol" #unique name using prefix
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 0
    protocol  = "ALL"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol  = "ALL"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name = "projekt-karol"
  cidr = "10.11.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b"]
  private_subnets = ["10.11.1.0/24", "10.11.2.0/24"]
  public_subnets  = ["10.11.101.0/24", "10.11.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
  }
}