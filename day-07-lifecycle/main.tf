resource "aws_instance" "dev" {
    ami= "ami-012967cc5a8c9f891"
    instance_type= "t2.micro"
    key_name= "3tier-project"
    availability_zone = "us-east-1a"

    tags = {
      Name="devops"
    }


#Below examples are for lifecycle meta_arguments..!!!

  lifecycle {
    create_before_destroy = true    #This attribute will create the new object first and then destroy the old one.
  }

lifecycle {
  prevent_destroy = true            #Terraform will error when it attempts to destroy a resource when this is set to true.                       
}


  lifecycle {
    ignore_changes = [tags,]        #This means that Terraform will never update the object but will be able to create or destroy it.
  }
}



