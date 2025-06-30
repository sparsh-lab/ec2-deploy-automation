provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  associate_public_ip_address = true  # Must be true
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "Techeazy"
  }

  user_data = file("user_data.sh")


  lifecycle {
    create_before_destroy = true
  }
}


data "aws_vpc" "default" {
  default = true
}


resource "aws_security_group" "allow_http" {

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




