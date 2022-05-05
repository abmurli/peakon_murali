output "fake-product-access-keys" {
  value = aws_iam_access_key.fake-products.encrypted_secret
}
