 variable "ami" {
    description = "inserting ami value"
    type = string
    default = ""
 }
 variable "type" {
   description = "inserting value for instance type"
   type = string
   default = "t2.medium"
 }
  variable "key" {
   description = "inserting value for key"
   type = string
   default = ""
  }
  variable "az" {
   type = string
   default = ""   
  }
  