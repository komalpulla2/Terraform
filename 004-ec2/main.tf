provider "aws" {
    region = "us-west-2"
  
}

resource "aws_instance" "ec2" {
    ami = "ami-008fe2fc65df48dac"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.ssh.name]
}

resource "aws_security_group" "ssh" {
    name = "Allow Https Traffic22"
  
}


resource "aws_vpc_security_group_ingress_rule" "ssh" {
    security_group_id = aws_security_group.ssh.id
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_ipv4 = "0.0.0.0/0"
  
}

resource "aws_vpc_security_group_egress_rule" "ssh" {
    security_group_id = aws_security_group.ssh.id
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_ipv4 = "0.0.0.0/0"
  
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
    value = aws_eip.elasticip.public_ip
  
}