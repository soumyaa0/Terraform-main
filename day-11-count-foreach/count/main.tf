resource "aws_instance" "first" {
  
  ami = var.ami
  instance_type = var.type
  key_name = var.key
  count = length(var.xyz)
  tags = {
    # Name = "dev"
    # Name = "dev-${count.index}"
      Name = var.xyz[count.index]
  }

}

variable "xyz" {
    type = list(string)
    default = ["dev", "ops", "web"]
  
}