variable "ami" {
  description = "please enter the value"
  default = "ami-0a866433198752a1e"
}

variable "subnet" {
  description = "enter the subnet_id"
  default = "subnet-02ae83de918f27fc3"
}

variable "security_group_id" {
  description = "enter value during execution"
  default = "sg-03073bb5a8e2803b8"
}

variable "instance_type" {
  description = "instance-type"
  default = "t2.micro"
}

variable "instance-name" {
  description = "name of the instance"
  default = "node3"
}