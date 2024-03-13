variable "ec2name" {
    type = string
}

variable "environment" {
    type = string
  
}

resource "aws_instance" "ec2" {
    ami = "ami-008fe2fc65df48dac"
    instance_type = "t2.micro"
    tags = {
        Name = var.ec2name
        Environment = var.environment
    }
}

output "instance_id" {
    value = aws_instance.ec2.id
    
}

output "tags" {
    value = aws_instance.ec2.tags_all
  
}

output "module_output" {
    value = module.ec2module.instance_id
}