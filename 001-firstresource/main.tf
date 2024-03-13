# Terraform registry documentations - https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# winget install graphviz
# terraform graph > graph.dot
# dot -Tpng graph.dot -o graph.png


provider "aws" {
    region = "us-west-2" 
}

resource "aws_vpc" "MyVpc" {
    cidr_block = "10.0.0.0/16"      
  
}