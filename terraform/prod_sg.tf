#security group to be attached to the EC2 in private subnet
resource "aws_security_group" "fake_product_prod_ec2" {
  name        = "fake_product_ec2"
  description = "SG for fake_product"
  vpc_id      = aws_vpc.vpcs["fake-product-production"].id

  ingress {
    description     = "Allow ssh to the bastion host LB"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.fake_product_prod_bastion_host_lb.id]
  }
  ingress {
    description     = "Allow http access to the product LB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.fake_product_prod_lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name        = "fake_product_ec2"
    environment = "production"
  }
}

#security group to be attached to the bastion host EC2 in private subnet
resource "aws_security_group" "fake_product_prod_ec2_bastion_host" {
  name        = "fake_product_prod_ec2_bastion_host"
  description = "SG for fake_product_prod bastion ec2"
  vpc_id      = aws_vpc.vpcs["fake-product-production"].id

  ingress {
    description     = "allow ssh to bastion host LB"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.fake_product_prod_bastion_host_lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name        = "fake_product_ec2_bastion_host"
    environment = "production"
  }
}

#security group to be attached to the bastion host LB
resource "aws_security_group" "fake_product_prod_bastion_host_lb" {
  name        = "fake_product_prod_bastion_host_lb"
  description = "SG for fake_product bastion host LB"
  vpc_id      = aws_vpc.vpcs["fake-product-production"].id

  ingress {
    description = "allow 2222"
    from_port   = 2222
    to_port     = 2222
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name        = "fake_product_prod_bastion_host_lb"
    environment = "production"
  }
}

#security group to be attached to the bastion host LB
resource "aws_security_group" "fake_product_prod_lb" {
  name        = "fake_product_prod_lb"
  description = "SG for fake_product product LB"
  vpc_id      = aws_vpc.vpcs["fake-product-production"].id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name        = "fake_product_prod_lb"
    environment = "production"
  }
}
