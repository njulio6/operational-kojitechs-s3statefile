
variable "region" {
  type    = string
  default = "us-east-1"
}

# string = ""
# list = []
# bool = True | False 
# dict = {}

variable "bucket_name" {
  description = "All state file name"
  type        = list(any)
}

variable "dynamo_table" {
    type = string
    default = "terraform-lock"
}