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
    # Establishing a connection from instance to terminal for further actions

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./jen.pem")
    host = aws_instance.baston.public_ip
  }

  # Adding files to instance

  provisioner "file" {
    source = "./jen.pem"
    destination = "/home/ec2-user/jen.pem"
  }
}
