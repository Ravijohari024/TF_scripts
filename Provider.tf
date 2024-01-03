
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAZQVQCKGB4LLKWLX3"
  secret_key = "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"
}
/*resource "aws_instance" "EC-2" {
  ami           = "ami-0c7217cdde317cfec"
  key_name      = "TF-Key"
  instance_type = var.EC2

  tags = {
    Name = "manual-TF-EC2"
  }
}*/
/*
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # owner should be canonical in free tier account i.e. "099720109477"
}

output "data_print" {
  value=data.aws_ami.ubuntu.id
}

resource "aws_instance" "uuntu_ec2"{
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}*/









/*
resource "aws_instance" "myec2"{
  for_each={
    t2.micro=""
    t3.miedium= ""
  }
  ami=for_each.value
  instance_type= for_each.key
}*/


resource "aws_iam_user" "dev-env-users" {
  
count= length(var.users_list)  
name = var.users_list[count.index]
  path = "/"

  tags = {
    tag-key = "iam_user"
  }
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "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"
}