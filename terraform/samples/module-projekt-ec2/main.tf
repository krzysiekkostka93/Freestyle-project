
resource "aws_instance" "my_instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = var.key_pair_name

  subnet_id = var.subnet_id

  vpc_security_group_ids = [aws_security_group.all_access.id]

  tags = var.tags
}

resource "aws_security_group" "all_access" {
  name_prefix = "karol" #unique name using prefix
  vpc_id = var.vpc_id

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
