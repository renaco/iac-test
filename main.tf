provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "myec2" {
  ami                     = "ami-08847abae18baa040"
  instance_type           = "t2.nano"
  key_name                = "AWS-VPC-019"

  root_block_device {
    volume_size           = "20"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }
}

resource "aws_security_group" "sg_ec2" {
  name        = "sg_ec2"
  description = "ec2 inbound and outbound"
  #vpc_id      = "vpc-84c166ed"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # security_groups = ["${var.security_group_access}"]
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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
