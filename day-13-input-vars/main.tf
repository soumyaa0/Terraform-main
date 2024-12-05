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

#Note: custom tfvar process ex: terraform.tfvar & input.tfvar ...etc    while applying time we can call required .tfvars 
#by defualt terraform.tfvars will work
#ex:# terraform apply -var-file="test.tfvars"   .....#You have to run like thi which one you want to execute..!!
