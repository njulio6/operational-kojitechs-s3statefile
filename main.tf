
locals {
  mandatory_tag = {
    line_of_business        = "hospital"
    ado                     = "max"
    tier                    = "WEB"
    operational_environment = upper(terraform.workspace)
    tech_poc_primary        = "udu.udu25@gmail.com"
    tech_poc_secondary      = "udu.udu25@gmail.com"
    application             = "http"
    builder                 = "udu.udu25@gmail.com"
    application_owner       = "kojitechs.com"
    vpc                     = "WEB"
    cell_name               = "WEB"
    component_name          = "kojitechs"
  }
}

# aws_s3_bucket.main.*.bucket

resource "aws_s3_bucket" "main" {
  count  = length(var.bucket_name)
  bucket = var.bucket_name[count.index]
}

# Create a bucket that would allow s3 cross account access with Terraform. 
resource "aws_dynamodb_table" "main" {
  name             = var.dynamo_table
  hash_key         = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
