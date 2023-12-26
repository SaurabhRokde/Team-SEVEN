resource "aws_instance" "exampur" {
  ami           = var.ami_value
  instance_type = var.instance_type_value
  subnet_id = var.subnet_id_value
   
}