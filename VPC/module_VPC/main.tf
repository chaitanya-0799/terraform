module "vpc" {
  source = "git::https://github.com/chaitanya-0799/terraform.git//VPC/main_VPC"
  aws-region = var.aws-region
  cidr-range = var.cidr-range
  vpc-name = var.vpc-name
  az-2a = var.az-2a
  cidr-az1 = var.cidr-az1
  az1-name = var.az1-name
  pvt-2a-cidr = var.pvt-2a-cidr
  pvt-2a-name = var.pvt-2a-name 
  az-2b = var.az-2b
  cidr-az2 = var.cidr-az2
  az2-name = var.az2-name
  pvt-2b-cidr = var.pvt-2b-cidr
  pvt-2b-name = var.pvt-2b-name
  az-2c = var.az-2c
  cidr-az3 = var.cidr-az3
  az3-name =  var.az3-name
  pvt-2c-cidr = var.pvt-2c-cidr
  pvt-2c-name = var.pvt-2c-name
  IGW-name = var.IGW-name
  nat-name = var.nat-name
  rt-name = var.rt-name
  rt-cidr = var.rt-cidr
  pvt-rt = var.pvt-rt
  sg-name = var.sg-name
}