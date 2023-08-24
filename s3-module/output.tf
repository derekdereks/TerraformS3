output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "The ARN of the bucket"
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.this.bucket_domain_name
  description = "The bucket domain name"
}

output "kms_key_id" {
  value       = aws_kms_key.this.key_id
  description = "The globally unique key ID for the KMS key"
}

output "kms_key_arn" {
  value       = aws_kms_key.this.arn
  description = "The ARN of the KMS key"
}
