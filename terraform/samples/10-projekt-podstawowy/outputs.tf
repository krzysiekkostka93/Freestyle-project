output "public_ip_address_1" {
  value = aws_instance.first.public_ip
}

output "public_ip_address_2" {
  value = var.create_second_instance ? aws_instance.second[0].public_ip : "" 
}