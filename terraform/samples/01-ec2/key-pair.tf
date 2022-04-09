data "local_file" "ssh_key" {
  filename = "/home/vagrant/.ssh/id_ed25519.pub"
}

resource "aws_key_pair" "this" {
  key_name   = "my-aws-key"
  public_key = data.local_file.ssh_key.content
  tags = {
    Name   = "demo"
    Training = "dor3"
  }
}
