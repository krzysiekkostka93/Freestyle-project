variable "key_pair_name" {
  type    = string
}

variable "subnet_id" {
  type    = string
}

variable "vpc_id" {
  type    = string
}

variable "tags" {
  type = map(any)
  default = {
    Name   = "projekt_dor3_karol"
    Training = "dor3"
    Terraform   = "true"
  }
}