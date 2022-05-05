data "aws_iam_policy_document" "s3-read-write" {
  statement {
    effect = "allow"
    actions = [
      "s3:PutObjectTagging",
      "s3:PutObject",
      "s3:ListBucketVersions",
      "s3:ListBucket",
      "s3:GetObjectVersion",
      "s3:GetObject"
    ]
    principals {
      type = "AWS"
      identifiers = [
        "*"
      ]
    }
    resources = [
      aws_s3_bucket.fake-product-assets.arn,
      "${aws_s3_bucket.fake-product-assets.arn}/*"
    ]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["true"]
    }
  }
  statement {
    effect = "Deny"
    actions = [
      "s3:*"
    ]
    principals {
      type = "AWS"
      identifiers = [
        "*"
      ]
    }
    resources = [
      aws_s3_bucket.fake-product-assets.arn,
      "${aws_s3_bucket.fake-product-assets.arn}/*"
    ]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }

}

data "aws_iam_policy_document" "enforce-mfa" {
  statement {
    effect = "Deny"
    not_actions = [
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice",
      "iam:ListVirtualMFADevices",
      "iam:EnableMFADevice",
      "iam:ResyncMFADevice",
      "iam:ListAccountAliases",
      "iam:ListUsers",
      "iam:ListSSHPublicKeys",
      "iam:ListAccessKeys",
      "iam:ListServiceSpecificCredentials",
      "iam:ListMFADevices",
      "iam:GetAccountSummary",
      "sts:GetSessionToken"
    ]
    resources = ["*"]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["true"]
    }
    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["false"]
    }
    condition {
      test     = "Bool"
      variable = "aws:ViaAWSService"
      values   = ["false"]
    }
  }

}
