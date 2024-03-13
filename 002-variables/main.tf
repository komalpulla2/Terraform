# understand declaring the variables and using 

provider "aws" {
  region = "eu-west-2"
}

# Declaring Variables in Terraform

variable "vpc-name" {
  type    = string
  default = "my-vpc"
}

variable "ssh-port" {
  type    = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "my-list" {
  type    = list(string)
  default = ["Value1", "Value2"]
}

variable "mymap" {
  type = map
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "TJ"
    port = [22, 25, 80]
  }
}

# Using the variables

variable "inputname" {
  type        = string
  description = "Set the VPC name to configure:"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.inputname
  }
}

output "vpcarn" {
  value = aws_vpc.myvpc.arn
}

