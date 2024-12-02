provider "aws" {
  
}
locals {
  region = "us-east-1"
  environment = "dev"
  instance_type = "t2.micro"
  ami = "ami-0453ec754f44f9a4a"
}

resource "aws_instance" "example" {
  ami           = local.ami # Amazon Linux 2 AMI
  instance_type = local.instance_type

  tags = {
    Name        = "ExampleInstance"
    Environment = local.environment
  }
}