variable "aws-region" {
  description = "aws region"
}
variable "cidr-range" {
  description = "cidr range of vpc"
}

variable "vpc-name" {
  description = "Name for VPC"
}

variable "cidr-az1" {
  description = "cidr range for subnet in az1"
}

variable "az-2a" {
  description = "Naming convention az-a in hyd"
}

variable "az-2b" {
  description = "Naming convention az-b in hyd"
}

variable "az-2c" {
  description = "Naming convention az-c in hyd"
}

variable "az1-name" {
  description = "Name for subnet in az1"
}

variable "cidr-az2" {
  description = "cidr range for subnet in az2"
}

variable "az2-name" {
  description = "Name for subnet in az2"
}

variable "cidr-az3" {
  description = "cidr range for subnet in az3"
}

variable "az3-name" {
  description = "Name for subnet in az3"
}

variable "pvt-2a-cidr" {
  description = "cidr range for pvt subnet in 2a"
}

variable "pvt-2a-name" {
  description = "name for pvt subnet in 2a"
}

variable "pvt-2b-cidr" {
  description = "cidr range for pvt subnet in 2b"
}

variable "pvt-2b-name" {
  description = "name for pvt subnet in 2b"
}

variable "pvt-2c-cidr" {
  description = "cidr range for pvt subnet in 2c"
}

variable "pvt-2c-name" {
  description = "name for pvt subnet in 2c"
}

variable "IGW-name" {
  description = "name for IGW"
}

variable "nat-name" {
  description = "NAT name"
}

variable "rt-name" {
  description = "Name for RT"
}

variable "rt-cidr" {
  description = "cidr for igw"
}

variable "pvt-rt" {
  description = "pvt-rt name"
}

variable "sg-name" {
  description = "name of security group"
}