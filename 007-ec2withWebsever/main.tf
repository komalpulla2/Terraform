provider "aws" {
    region = "us-west-2"
}

module "db" {
    source = "./db"
    
}

module "web" {
    source = "./web"  
}

output "PrivateIP" {
    value = module.db.PrivateIP
}

output "PublicIP" {
    value = module.web.pub_ip
}