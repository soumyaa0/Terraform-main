# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
  region = "ap-south-1"
}

#Another provider alias..!!
provider "aws" {
  region = "us-east-1"
  alias = "provider2"
}

resource "aws_s3_bucket" "test" {
  bucket = "del-hyd-naresh-ittt"

}
resource "aws_s3_bucket" "test2" {
  bucket = "del-hyd-naresh-ittt-test2"
  provider = aws.provider2  #provider.value of alias
  
}