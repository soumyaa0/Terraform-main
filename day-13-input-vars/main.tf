# create instance 

resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = "dev-ec3"
    }
}


#terraform apply -var="ami=ami-0453ec754f44f9a4a" -var="instance_type=t2.micro"
#insert varaibles while apply time