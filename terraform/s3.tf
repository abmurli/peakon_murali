resource "aws_s3_bucket" "fake-product-assets" {
  bucket = "fake-product-assets"
  versioning {
    enabled = true
  }
  tags = {
    name        = "fake-product-assets"
    environment = "production"
  }
}

resource "aws_s3_bucket_acl" "fake-product-assets" {
  bucket = aws_s3_bucket.fake-product-assets.id
  acl    = "private"
}
