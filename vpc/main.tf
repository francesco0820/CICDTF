# 1 vpc, 1 subnet and 1 security

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      "Name" = "myvpc"
    }
  
}

resource "aws_subnet" "pb_sn" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"

    tags = {
      "Name" = "pb_sn1"
    }
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.myvpc.id
  name = "my_sg"
  description = "Public Security"
}

resource "aws_vpc_security_group_ingress_rule" "sg_ing" {
  security_group_id = aws_security_group.sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "sg_egr" {
  security_group_id = aws_security_group.sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
  
