


/*resource "aws_instance" "Ubuntu_EC2" {
    ami           = "ami-0c7217cdde317cfec"
  key_name      = "TF-Script"
  instance_type = "t2.micro"
  tags = {
    Name = "Provisioners-EC2"
  }
  # ...

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("TF-Script.pem")}"

    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}*/
