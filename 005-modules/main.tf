provider "aws" {
    region = "us-west-2"
}

variable "instance-name" {
    type = string
  
}

variable "environment" {
    type = string
  
}


module "ec2module" {
    source = "./ec2"
    ec2name = var.instance-name
    environment = var.environment
    
}

output "module_output" {
    value = module.ec2module.instance_id
}