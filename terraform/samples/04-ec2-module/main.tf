provider "aws" {
  region = "eu-west-2"
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

module "instance_from_module" {
  source = "../modules/instance"

  region = "eu-west-2"
  ami           = data.aws_ami.ubuntu.id
  key_pair_name = aws_key_pair.this.key_name
  name          = "from-module"
}