# create instance 

provider "aws" {

}

resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance_type
    # subnet_id = "subnet-0f1500a3b8638b727"
    key_name = var.key_name
    # vpc_security_group_ids = [ aws_security_group.allow_traffic.id ]
    tags = {
      Name = "dev-ec3"
    }
}
