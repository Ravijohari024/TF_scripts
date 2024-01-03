resource "aws_instance" "Ubuntu_EC2" {
    ami           = "ami-0c7217cdde317cfec"
  key_name      = "TF-Script"
  instance_type = lookup(var.myec2,terraform.workspace,"t2.nano")
  tags = {
    Name = "Workspace-EC2"
  }
}

variable "myec2" {
    type= map
    default={
        "prod"= "t2.large"
        "dev"= "t2.micro"
        "stage"= "t2.medium"
    }

}