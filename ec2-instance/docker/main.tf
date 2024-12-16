resource "aws_instance" "docker" {
  ami = var.ami
  key_name = var.key-name
  instance_type = var.instance-type
  security_groups = [ var.security_groups-id]
  subnet_id = var.subnet-id
  associate_public_ip_address = true
  tags = {
    Name = var.instance_Name
  }

  connection {
    user = var.user
    type = "ssh"
    private_key = file("./key.pem") 
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo apt install -y git",
        "git clone https://github.com/chaitanya-0799/docker.git /tmp/docker",
        "cd /tmp/docker/ && sudo chmod +x install.sh && ./install.sh"
     ]
  }

}