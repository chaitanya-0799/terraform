provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "aws_instance" {
  ami = var.ami
  subnet_id = var.subnet
  security_groups = [ var.security_group_id ]
  associate_public_ip_address = true
  instance_type = var.instance_type
  key_name = "jen"
  tags = {
    Name= var.instance-name
  }
}

