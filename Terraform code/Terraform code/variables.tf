provider "aws" {
	region = "ap-south-1"
	access_key = "AKIAVSG4VN6A4NXOHNSD"
	secret_key     = "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"
}
variable "instance_count" {
default = "1"
}

variable "ami_id" {
default = "ami-0667149a69bc2c367"
}

variable "region_az" {
default = "ap-south-1b"
}
variable "instance_type" {
  default = "t2.medium"
}
variable "keypair_name" {   #TBC
  default = "docker"
}

variable "subnetid" {            
  default = "subnet-0fc63896c653b746e"
}

variable "associate_public_ip_address" {
  default = "true"
}

variable "volume_type"{
  default = "gp2"
}
variable "volume_size"{
  default = 100
}
variable "delete_on_termination"{
  default = "false"
}
variable "vpcid" {              
  default = "vpc-01e1e00f88d42a9a7"
} 