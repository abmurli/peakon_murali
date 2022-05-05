resource "aws_iam_user" "user" {
  for_each = var.users
  name     = each.value
  path     = each.value["path"]
}

resource "aws_iam_policy_attachment" "s3-read-write" {
  name       = "admin_access_policy"
  users      = [aws_iam_user.user["emma"].name, aws_iam_user.user["liam"].name]
  policy_arn = var.admin_access_policy_arn
}

resource "aws_iam_user_policy" "emma-enforce-mfa" {
  name   = "enforce_mfa"
  user   = aws_iam_user.user["emma"].name
  policy = data.aws_iam_policy_document.enforce-mfa.json
}

resource "aws_iam_user_policy" "liam-enforce-mfa" {
  name   = "enforce_mfa"
  user   = aws_iam_user.user["liam"].name
  policy = data.aws_iam_policy_document.enforce-mfa.json
}

resource "aws_iam_user_policy" "fake-product" {
  name   = "fake-product"
  user   = aws_iam_user.user["fake-product"].name
  policy = data.aws_iam_policy_document.s3-read-write.json
}

resource "aws_iam_access_key" "fake-products" {
  user    = aws_iam_user.user["fake-product"].name
  pgp_key = "keybase:some_person_that_exists"
}
