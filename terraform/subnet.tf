resource "aws_subnet" "fake-product-production-subnet" {
  for_each   = var.prod_subnets
  vpc_id     = aws_vpc.vpcs["fake-product-production"].id
  cidr_block = each.value["cidr_block"]

  tags = {
    name        = each.key
    environment = "production"
  }
}

resource "aws_subnet" "Fake-product-staging-subnet" {
  for_each   = var.staging_subnets
  vpc_id     = aws_vpc.vpcs["Fake-product-staging"].id
  cidr_block = each.value["cidr_block"]

  tags = {
    name        = each.key
    environment = "staging"
  }
}
