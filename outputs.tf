output "bucket_name" {
description = "Name of all buckets" 
  value = aws_s3_bucket.main.*.bucket
}