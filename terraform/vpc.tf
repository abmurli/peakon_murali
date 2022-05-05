resource "aws_vpc" "vpcs" {
  for_each             = var.vpcs
  cidr_block           = each.value["cidr_block"]
  instance_tenancy     = each.value["instance_tenancy"]
  enable_dns_hostnames = each.value["enable_dns_hostnames"]

  tags = {
    name        = each.key
    environment = each.value["environment"]
  }
}
