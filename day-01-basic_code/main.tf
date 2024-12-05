resource "aws_instance" "first" {
  
  ami = var.ami
  instance_type = var.type
  key_name = var.key
  availability_zone = var.az

}
resource "aws_instance" "second" {
  
  ami = var.ami
  instance_type = var.type
  key_name = var.key
  availability_zone = var.az
}





#Note: custom tfvar process ex: terraform.tfvar & input.tfvar ...etc    while applying time we can call required .tfvars 
#by defualt terraform.tfvars will work
#ex:# terraform apply -var-file="test.tfvars"   .....#You have to run like thi which one you want to execute.!!