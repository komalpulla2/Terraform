provider "aws" {
    region = "us-west-2"
  
}

resource "aws_instance" "myEC2" {
    ami = "ami-008fe2fc65df48dac"
    instance_type = "t2.micro"
    count = 3

}

output "myEC2_ids" {
  #   value = aws_instance.myEC2.id  -- for output of one ec2 instace
  value = [for instance in aws_instance.myEC2 : instance.id]
}

