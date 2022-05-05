# route table for staging public subnet
resource "aws_route_table" "Fake-product-staging-public" {
  vpc_id = aws_vpc.vpcs["Fake-product-staging"].id

  route {
    cidr_block = var.internet_cidr
    # internetgateway not created
    gateway_id = var.internet_gateway_id
  }

  tags = {
    name        = "Fake-product-staging-public"
    environment = "production"
  }
}
# route table for staging private subnet
resource "aws_route_table" "Fake-product-staging-private" {
  vpc_id = aws_vpc.vpcs["Fake-product-staging"].id

  route {
    cidr_block = var.internet_cidr
    # internetgateway not created
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    name        = "Fake-product-staging-private"
    environment = "production"
  }
}

# route association for staging public subnet
resource "aws_route_table_association" "Fake-product-staging-public" {
  subnet_id      = aws_subnet.Fake-product-staging-subnet["Fake-product-staging-public"].id
  route_table_id = aws_route_table.Fake-product-staging-public.id
}
# route association for staging private subnet
resource "aws_route_table_association" "Fake-product-staging-private" {
  subnet_id      = aws_subnet.Fake-product-staging-subnet["Fake-product-staging-private"].id
  route_table_id = aws_route_table.Fake-product-staging-private.id
}
