variable "vpc_cidr_block" {
  type = string
  default = "18.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  type = list(string)
  default = ["18.0.1.0/24", "18.0.2.0/24", "18.0.3.0/24"]
}

variable "private_subnet_cidr_blocks" {
  type = list(string)
  default = ["18.0.4.0/24","18.0.5.0/24", "18.0.6.0/24"]
}

variable "availability_zones" {
  type = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "project_name" {
  type = string
  default = "open-telementary"  
}

