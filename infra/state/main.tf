provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "this" {
  bucket = "namnd-com"
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  object_lock_enabled = "Enabled"

  depends_on = [aws_s3_bucket_versioning.this]
}

