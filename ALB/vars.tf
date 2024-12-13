# LOAD BALANCER
variable "ALB-NAME" {
  description = "Name of ALB"
  default = "tf-trail-ALB"
}

variable "ALB-TYPE" {
  description = "Type of load balancer"
  default = "application"
}

# TARGET-GROUP
variable "worker-tg-name" {
  default = "woker-tg"
}

variable "node-tg-name" {
  default = "node-tg"
}

variable "health_check_path" {
  default = "/var/www/html/"
}