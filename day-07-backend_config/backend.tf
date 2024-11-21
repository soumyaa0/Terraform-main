
terraform {
 backend "s3" {
    bucket         = "awsdevopsss"  # Name of the S3 bucket where the state will be stored.
    region         =  "ap-south-1"
    key            = "terraform.tfstate" # Path within the bucket where the state will be read/written.
    dynamodb_table = "terraform-state-lock-" # DynamoDB table used for state locking, note: first run day-6-bckend resources then day-7-backend config
    encrypt        = true  # Ensures the state is encrypted at rest in S3.
}
}