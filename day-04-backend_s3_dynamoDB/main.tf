#Creating s3 bucket and dynamo DB for stste backend storage and applying..!!!
resource "aws_s3_bucket" "name" {
    bucket = var.bucket_name
  
}
resource "aws_dynamodb_table" "dynamodb-state-lock" {
    name = "terraform-state-lock"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20

    attribute {
      name = "LockID"
      type = "S"
    }
  
}