resource "aws_security_group" "allow_tls" {
  name        = "my-sg-tf-dev-env"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each= var.ports
    content {
            description      = "TLS from VPC"
            from_port        = ingress.value
            to_port          = ingress.value
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }
  }

 dynamic "egress" {
    for_each =var.ports 
    content{
        from_port        = egress.value
        to_port          = egress.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        }
 }    
  tags = {
    Name = "my-sg-tf-dev-env"
  }
}

