output "public-ip-address" {
       value = aws_instance.exampur.public_ip
       
}

output "public-ip-payal" {
       value = aws_instance.exampur.private_ip
       
}
