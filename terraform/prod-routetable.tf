# route table for production public subnet
resource "aws_route_table" "fake-product-production-public" {
  vpc_id = aws_vpc.vpcs["fake-product-production"].id

  route {
    cidr_block = "::/0"
    # internetgateway not created
    gateway_id = var.internet_gateway_id
  }

  tags = {
    name        = "fake-product-production-public"
    environment = "production"
  }
}
# route table for production private subnet
resource "aws_route_table" "fake-product-production-private" {
  vpc_id = aws_vpc.vpcs["fake-product-production"].id

  route {
    cidr_block = "::/0"
    # natgateway not created
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    name        = "fake-product-production-private"
    environment = "production"
  }
}

# route association for production private subnet
resource "aws_route_table_association" "fake-product-production-private" {
  subnet_id      = aws_subnet.fake-product-production-subnet["fake-product-production-private"].id
  route_table_id = aws_route_table.fake-product-production-private.id
}
# route association for production public subnet
resource "aws_route_table_association" "fake-product-production-public" {
  subnet_id      = aws_subnet.fake-product-production-subnet["fake-product-production-public"].id
  route_table_id = aws_route_table.fake-product-production-public.id
}
