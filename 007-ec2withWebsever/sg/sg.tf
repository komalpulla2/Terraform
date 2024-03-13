

variable "ingress" {
    type = list(number)
    default = [22,80]
}

variable "egress" {
    type = list(number)
    default = [22,80]
}

resource "aws_security_group" "web_traffic" {
    name = "Allow Web Traffic"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
            from_port = port.value
            to_port = port. value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egress
        content {
            from_port = port.value
            to_port = port. value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}


output "sg_name" {
    value = aws_security_group.web_traffic.name
}



# resource "aws_security_group" "https" {
#     name = "Allow Https Traffic22"
  
# }


# resource "aws_vpc_security_group_ingress_rule" "https" {
#     security_group_id = aws_security_group.https.id
#     ip_protocol = "tcp"
#     from_port = 80
#     to_port = 80
#     cidr_ipv4 = "0.0.0.0/0"
  
# }

# resource "aws_vpc_security_group_egress_rule" "https" {
#     security_group_id = aws_security_group.https.id
#     ip_protocol = "tcp"
#     from_port = 80
#     to_port = 80
#     cidr_ipv4 = "0.0.0.0/0"
  
# }