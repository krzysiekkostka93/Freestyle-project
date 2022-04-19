variable "create_second_instance" {
  type    = bool
  default = false
}

variable "tags" {
  type = map(any)
  default = {
    Name   = "projekt_dor3_karol"
    Training = "dor3"
    Terraform   = "true"
  }
}

variable "cidr" {
  type    = string
  default = "10.11.0.0/16"
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.11.1.0/24", "10.11.2.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.11.1.0/24", "10.11.2.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b"]
}

variable "suffix" {
  type    = string
  default = "karol"
}