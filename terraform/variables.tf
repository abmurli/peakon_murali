variable "users" {
  description = "iam user list"
  type = map(object({
    path = string
  }))
  default = {
    "emma" = {
      path = "/"
    }
    "liam" = {
      path = "/"
    }
    "fake-products" = {
      path = "/system"
    }
  }
}

variable "admin_access_policy_arn" {
  description = "admin access policy arn"
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "internet_cidr" {
  description = "internet CIDR"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpcs" {
  description = "vpc list"
  type = map(object({
    cidr_block           = string
    instance_tenancy     = string
    enable_dns_hostnames = bool
  }))
  default = {
    "fake-product-production" = {
      cidr_block           = "192.168.0.0/16"
      instance_tenancy     = "dedicated"
      enable_dns_hostnames = true
      environement         = "production"
    }
    "Fake-product-staging" = {
      cidr_block           = "176.0.0.0/16"
      instance_tenancy     = "default"
      enable_dns_hostnames = true
      environement         = "staging"
    }
  }
}

variable "prod_subnets" {
  description = "prod subnet list"
  type = map(object({
    cidr_block = string
  }))
  default = {
    "fake-product-production-private" = {
      cidr_block = "192.168.0.0/24"
    }
    "fake-product-production-public" = {
      cidr_block = "192.168.1.0/24"
    }
  }
}

variable "staging_subnets" {
  description = "staging subnet list"
  type = map(object({
    cidr_block = string
  }))
  default = {
    "Fake-product-staging-private" = {
      cidr_block = "176.0.0.0/24"
    }
    "Fake-product-staging-public" = {
      cidr_block = "176.0.1.0/24"
    }
  }
}

variable "nat_gateway_id" {
  default = ""
}

variable "internet_gateway_id" {
  default = ""
}
