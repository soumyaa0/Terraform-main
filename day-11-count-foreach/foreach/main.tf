resource "aws_instance" "first" {
  
  ami = var.ami
  instance_type = var.type
  key_name = var.key
  for_each = toset(var.xyz)
  tags = {
    # Name = "dev"
    # Name = "dev-${count.index}"
      Name = each.value
  }

}

variable "xyz" {
    type = list(string)
    default = ["dev", "ops", "web"]
  
}