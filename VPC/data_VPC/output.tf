# id of VPC
output "vpc_id" {
  value = data.aws_vpc.vpc.id
}


# ID'S OF ALL SUBNETS IN VPC

output "subnet-ids" {
  value = data.aws_subnets.vpc-1.ids
}
   
    # DETAILED INFO ON EACH SUBNET 
output "Detailed_subnet_info" {
  value = [
    for subnet in data.aws_subnet.pub : {
      id                  = subnet.id
      cidr_block          = subnet.cidr_block
      availability_zone   = subnet.availability_zone
      map_public_ip_on_launch = subnet.map_public_ip_on_launch
      tags                = subnet.tags
    }
  ]
}



# ID'S OF ALL SECURITY GROUPS IN VPC

output "security-groups" {
  value = data.aws_security_groups.vpc-sg.ids
}

    # DETAILED INFO ON EACH SECURITY_GROUP
output "Detailed_sgs" {
  value = [
    for sg in data.aws_security_group.individual : {
      id    = sg.id 
      tags  = sg.tags
    }
  ]
}
