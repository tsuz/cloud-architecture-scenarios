
# Prefix naming of resources in AWS console
variable "name" {
  default = "taku-3dc-ec2"
}

# CIDR Block of Jumphost in DC1. Must not overlap with ec2_vpc_cidr_block
variable "jumphost_vpc_cidr_block" {
  default = "172.22.0.0/16"
}

# CIDR Block of VPC in DC1. Must be a subset of CIDR in dc1_zones
variable "dc1_vpc_cidr_block" {
  default = "172.16.0.0/16"
}

# CIDR Block of VPC in DC2. Must be a subset of CIDR in dc2_zones
variable "dc2_vpc_cidr_block" {
  default = "172.17.0.0/16"
}

# CIDR Block of VPC in DC3. Must be a subset of CIDR in dc3_zones
variable "dc3_vpc_cidr_block" {
  default = "172.18.0.0/16"
}

# Instance types of EC2s to be deployed in 3DCs. The EC2 for the jumphost is hardcoded.
variable "instance_type" {
  default = "t3.medium"
}

# Name of the SSH key to be setup in DC1 instances.
# This must be uploaded beforehand in DC1 so it can be referenced as a string
variable "dc1_ssh_keyname" {
  default = "ap_northeast_1_taku"
}

# Name of the SSH key to be setup in DC2 instances
# This must be uploaded beforehand in DC2 so it can be referenced as a string
variable "dc2_ssh_keyname" {
  default = "ap_northeast_3_taku"
}

# Name of the SSH key to be setup in DC2 instances
# This must be uploaded beforehand in DC2 so it can be referenced as a string
variable "dc3_ssh_keyname" {
  default = "ap_northeast_2_taku"
}

# Where to deploy jumphost for SSH access
variable "jumphost_az" {
  default = "ap-northeast-1a"
}

# Region definition of DC1
variable "dc1_region" {
  default = "ap-northeast-1"
}

# Region definition of DC2
variable "dc2_region" {
  default = "ap-northeast-3"
}

# Region definition of DC3
variable "dc3_region" {
  default = "ap-northeast-2"
}

# DC1 zones configuration. 
# Add/subtract any keys in private_subnets to change the number of zones
variable "dc1_zones" {
  type = map(any)
  default = {
    private_subnets = {
      private-1a = {
        name = "private-1a"
        cidr = "172.16.10.0/24"
        az   = "ap-northeast-1a"
      },
      private-1c = {
        name = "private-1c"
        cidr = "172.16.11.0/24"
        az   = "ap-northeast-1c"
      },
      private-1d = {
        name = "private-1d"
        cidr = "172.16.12.0/24"
        az   = "ap-northeast-1d"
      }
    }
  }
}

# DC2 zones configuration. 
# Add/subtract any keys in private_subnets to change the number of zones
variable "dc2_zones" {
  type = map(any)
  default = {
    private_subnets = {
      private-1a = {
        name = "private-3a"
        cidr = "172.17.20.0/24"
        az   = "ap-northeast-3a"
      },
      private-1c = {
        name = "private-3b"
        cidr = "172.17.21.0/24"
        az   = "ap-northeast-3b"
      },
      private-1d = {
        name = "private-3c"
        cidr = "172.17.22.0/24"
        az   = "ap-northeast-3c"
      }
    }
  }
}

# DC3 zones configuration. 
# Add/subtract any keys in private_subnets to change the number of zones
variable "dc3_zones" {
  type = map(any)
  default = {
    private_subnets = {
      private-1a = {
        name = "private-2a"
        cidr = "172.18.20.0/24"
        az   = "ap-northeast-2a"
      },
      private-1d = {
        name = "private-2c"
        cidr = "172.18.22.0/24"
        az   = "ap-northeast-2c"
      }
    }
  }
}