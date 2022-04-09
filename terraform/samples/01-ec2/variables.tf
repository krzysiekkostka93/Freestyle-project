variable "sg_name" {
  type    = string
  default = "My-demo-secyrity-group"
}

variable "tags" {
  type = map(any)
  default = {
    Name   = "demo_dor3"
    Training = "dor3"
    Terraform   = "true"
  }
}