# REGION
aws-region = "ap-south-2"

# VPC
cidr-range   = "11.0.0.0/16"
vpc-name = "2-tier-app"

# AZ_2A
az-2a = "ap-south-2a"
    #PUBLIC
cidr-az1 = "11.0.0.0/20"
az1-name = "PUB-az-2a"
    # PRIVATE
pvt-2a-cidr = "11.0.48.0/20"
pvt-2a-name = "PVT-az-2a"


# AZ_2B
az-2b = "ap-south-2b"
    # PUBLIC_SUBNET
cidr-az2 = "11.0.16.0/20"
az2-name = "PUB-az-2b"
    # PRIVATE_SUBNET
pvt-2b-cidr = "11.0.64.0/20"
pvt-2b-name = "PVT-az-2b"


# AZ_2C
az-2c = "ap-south-2c"
    # PUBLIC_SUBNET
cidr-az3 = "11.0.32.0/20"
az3-name =  "PUB-az-2c"
    # PRIVATE_SUBNET
pvt-2c-cidr = "11.0.80.0/20"
pvt-2c-name = "PVT-az-2c"

# IGW
IGW-name = "IGW-2-tier-app"

# NAT
nat-name = "demo-NAT"

# ROUTE_TABLE
rt-name = "rt-2TierApp"
rt-cidr = "0.0.0.0/0"
pvt-rt = "pvt-rt"

# SECURITY_GROUP
sg-name = "sg-2TierApp"