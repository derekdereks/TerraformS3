resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
        kms_master_key_id = var.kms_key_id
      }
    }
  }

  logging {
    target_bucket = var.logging_target_bucket
    target_prefix = var.logging_target_prefix
  }

  versioning {
    enabled = var.versioning_enabled
  }

  tags = var.tags
}

resource "aws_kms_key" "this" {
  description = "KMS key for the S3 bucket"
  is_enabled  = true
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.bucket_name}"
  target_key_id = aws_kms_key.this.key_id
}
