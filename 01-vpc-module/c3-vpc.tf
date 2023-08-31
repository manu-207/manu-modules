# Create VPC Module 

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my7-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]         # choose no.of azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]       # public subnets
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]   #  private subnets
  
  database_subnets = ["10.0.151.0/24", "10.0.172.0/24"]  # database subnets
  create_database_subnet_group = true                    # create database subnet group 
  create_database_subnet_route_table = true              # create database subnet routable

  # nat gateway
  enable_nat_gateway = true

  # vpc dns parameters
  enable_dns_hostnames = true
  enable_dns_support  = true 

  # subnets 
  public_subnet_tags {
    name = "public-subnets"
  }
  private_subnet_tags {
    name = "private-subnets"
  }

  database_subnet_tags {
    name = "publidatabase-subnets"
  }

  tags = {
    owner = "manu"
    Environment = "dev"
  }

  vpc_tags {
    name = "vpc-dev"
  }
}
