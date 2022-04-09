variable "instance_names" {
  type = list
  default = ["test_abc1", "test_abc2", "test_abc3"]
}

resource "aws_instance" "for_each_test" {
  for_each = toset(var.instance_names)

  ami           = "ami-0f7379fbe4fcc0400"
  instance_type = "t2.micro"

  tags = {
    Name = each.value
  }
}