provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
  ami                     = "ami-07d9b9ddc6cd8dd30"
  instance_type           = "t2.micro"
  key_name = "dpp"
 }
# security grp
resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH access"

ingress {
description = "Shh access"
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
description = "Http"
from_port = 8080
to_port = 8080
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
ipv6_cidr_blocks = ["::/0"]
}

  
  tags = {
    Name = "demo-sg"
  }
}