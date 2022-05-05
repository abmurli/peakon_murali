resource "aws_network_acl" "Fake-product-staging" {
  vpc_id = aws_vpc.vpcs["Fake-product-staging"].id

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.internet_cidr
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.internet_cidr
    from_port  = 443
    to_port    = 443
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.internet_cidr
    from_port  = 80
    to_port    = 80
  }

  tags = {
    name        = "Fake-product-staging"
    environment = "staging"
  }
}
