# main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS provider to use us-west-1 (N. California)
provider "aws" {
  region = "us-west-1" 
}

# Create a VPC in two availability zones for high availability
module "vpc" {
  source = "./modules/vpc" 

  vpc_cidr_block = "10.0.0.0/16"
  # Use AZs in us-west-1
  azs            = ["us-west-1a", "us-west-1b"] 
}

# Create security groups for the different tiers
module "security_groups" {
  source = "./modules/security_groups" 

  vpc_id = module.vpc.vpc_id
}

# Launch web server instances in both AZs
module "web_server_a" {
  source = "./modules/ec2" 

  instance_name    = "web-server-a"
  ami              = var.web_server_ami
  instance_type    = var.web_server_instance_type
  subnet_id        = element(module.vpc.public_subnet_ids, 0)
  security_group_id = module.security_groups.web_sg_id
  user_data        = filebase64("./user_data/web_server.sh")
}

module "web_server_b" {
  source = "./modules/ec2" 

  instance_name    = "web-server-b"
  ami              = var.web_server_ami
  instance_type    = var.web_server_instance_type
  subnet_id        = element(module.vpc.public_subnet_ids, 1)
  security_group_id = module.security_groups.web_sg_id
  user_data        = filebase64("./user_data/web_server.sh")
}

# Launch application server instances in both AZs
module "app_server_a" {
  source = "./modules/ec2" 

  instance_name    = "app-server-a"
  ami              = var.app_server_ami
  instance_type    = var.app_server_instance_type
  subnet_id        = element(module.vpc.private_subnet_ids, 0)
  security_group_id = module.security_groups.app_sg_id
  user_data        = filebase64("./user_data/app_server.sh")
}

module "app_server_b" {
  source = "./modules/ec2" 

  instance_name    = "app-server-b"
  ami              = var.app_server_ami
  instance_type    = var.app_server_instance_type
  subnet_id        = element(module.vpc.private_subnet_ids, 1)
  security_group_id = module.security_groups.app_sg_id
  user_data        = filebase64("./user_data/app_server.sh")
}

# Create a multi-AZ RDS database for high availability
module "database" {
  source = "./modules/rds" 

  identifier              = var.db_identifier
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = module.vpc.db_subnet_group_name
  vpc_security_group_ids = [module.security_groups.db_sg_id]
  multi_az                = true
}