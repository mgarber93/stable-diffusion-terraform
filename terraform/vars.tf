variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AWS_KEY_PAIR" {
  default = "YOUR_KEY_PAIR"
}

variable "EC2_INSTANCE_TYPE" {
  default = "g4dn.xlarge"
}

variable "EC2_INSTANCE_SPOT_PRICE" {
  default = "0.24192"
}

variable "EC2_INSTANCE_DISK_SIZE" {
  default = 100
}

variable "VPC_ID" {
}

# The subnet ID must be in the same availability zone as above
variable "SUBNET_ID" {
}

variable "MY_IP_ADDRESS" {
}

variable "PUBLIC_KEY" {
}