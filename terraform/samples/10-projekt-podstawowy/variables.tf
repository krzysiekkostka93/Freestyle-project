variable "create_second_instance" {
  type    = bool
  default = true
}

variable "tags" {
  type = map(any)
  default = {
    Name   = "projekt_dor3_karol"
    Training = "dor3"
    Terraform   = "true"
  }
}