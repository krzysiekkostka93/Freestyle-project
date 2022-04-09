provider "aws" {
  region = "eu-west-2"
}

terraform {
  required_version = "~> 1.1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "test" {
  count = 3

  #ami = "ami-0f7379fbe4fcc0400" #eu-west-2 08.04
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.demo.id]

  tags = {
    #    Name = var.instance_name
    Name = "${var.instance_name}-${count.index}"
  }

}