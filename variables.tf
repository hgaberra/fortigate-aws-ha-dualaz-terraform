variable "access_key" {}
variable "secret_key" {}
variable "region" {
  description = "Provide the region to deploy the VPC in"
  default = "us-east-1"
}
variable "availability_zone1" {
  description = "Provide the first availability zone to create the subnets in"
  default = "us-east-1a"
}
variable "availability_zone2" {
  description = "Provide the second availability zone to create the subnets in"
  default = "us-east-1b"
}
variable "security_vpc_cidr" {
  description = "Provide the network CIDR for the VPC"
  default = "10.0.0.0/16"
}
variable "security_vpc_public_subnet_cidr1" {
  description = "Provide the network CIDR for the public subnet1 in security vpc"
  default = "10.0.1.0/24"
}
variable "security_vpc_private_subnet_cidr1" {
  description = "Provide the network CIDR for the private subnet1 in security vpc"
  default = "10.0.3.0/24"
}
variable "security_vpc_hamgmt_subnet_cidr1" {
  description = "Provide the network CIDR for the hamgmt subnet1 in security vpc"
  default = "10.0.5.0/24"
}
variable "security_vpc_public_subnet_cidr2" {
  description = "Provide the network CIDR for the public subnet2 in security vpc"
  default = "10.0.2.0/24"
}
variable "security_vpc_private_subnet_cidr2" {
  description = "Provide the network CIDR for the private subnet2 in security vpc"
  default = "10.0.4.0/24"
}
variable "security_vpc_hamgmt_subnet_cidr2" {
  description = "Provide the network CIDR for the hamgmt subnet2 in security vpc"
  default = "10.0.6.0/24"
}
variable "security_vpc_tgwattach_subnet_cidr1" {
  description = "Provide the network CIDR for the tgwattach subnet1 in security vpc"
  default = "10.0.7.0/24"
}
variable "security_vpc_tgwattach_subnet_cidr2" {
  description = "Provide the network CIDR for the tgwattach subnet2 in security vpc"
  default = "10.0.8.0/24"
}
variable "instance_type" {
  description = "Provide the instance type for the FortiGate instances"
  default = "c6i.xlarge"
}
variable "cidr_for_access" {
  description = "Provide a network CIDR for accessing the FortiGate instances"
  default = "0.0.0.0/0"
}
variable "keypair" {
  description = "Provide a keypair for accessing the FortiGate instances"
  default = ""
}
variable "encrypt_volumes" {
  description = "Provide 'true' to encrypt the FortiGate instances OS and Log volumes with your account's KMS default master key for EBS.  Otherwise provide 'false' to leave unencrypted"
  default = "true"
}
variable "only_private_ec2_api" {
  description = "Provide 'true' if only private EC2 API access is allowed for HAMgmt interfaces.  Otherwise provide 'false' to use dedicated EIPs to access the public EC2 API endpoints.  ***Note*** No EIP will be assigned to the HAMgmmt interfaces.  Login via the floating Cluster EIP or directly to each VM witht the private IP of the HAMgmt interface."
  default = "false"
}
variable "fortios_version" {
  description = "Provide the verion of FortiOS to use (latest GA AMI will be used), 7.0, 7.2, or 7.4"
  default = "7.2"
}
variable "license_type" {
  description = "Provide the license type for the FortiGate instances, byol flex, or payg"
  default = "payg"
}
variable "fgt1_byol_license" {
  description = "[BYOL only] Provide the BYOL license filename for FortiGate1 and place the file in the root module folder"
  default = ""
}
variable "fgt2_byol_license" {
  description = "[BYOL only]Provide the BYOL license filename for FortiGate2 and place the file in the root module folder"
  default = ""
}
variable "fgt1_fortiflex_token" {
  description = "[FortiFlex only]Provide the FortiFlex Token for FortiGate1 (ie 1A2B3C4D5E6F7G8H9I0J)"
  default = ""
}
variable "fgt2_fortiflex_token" {
  description = "[FortiFlex only]Provide the FortiFlex Token for FortiGate2 (ie 2B3C4D5E6F7G8H9I0J1K)"
  default = ""
}
variable "security_vpc_public_subnet1_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from security_vpc_public_subnet1)"
  default = "10.0.1.1"
}
variable "security_vpc_private_subnet1_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from security_vpc_private_subnet1)"
  default = "10.0.3.1"
}
variable "security_vpc_hamgmt_subnet1_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from security_vpc_hamgmt_subnet1)"
  default = "10.0.5.1"
}
variable "security_vpc_public_subnet2_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from security_vpc_public_subnet2)"
  default = "10.0.2.1"
}
variable "security_vpc_private_subnet2_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from security_vpc_private_subnet2)"
  default = "10.0.4.1"
}
variable "security_vpc_hamgmt_subnet2_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from security_vpc_hamgmt_subnet2)"
  default = "10.0.6.1"
}
variable "fgt1_public_ip" {
  description = "Provide the IP address in CIDR form for the public interface of fgt1 (IP from security_vpc_public_subnet)"
  default = "10.0.1.11/24"
}
variable "fgt1_private_ip" {
  description = "Provide the IP address in CIDR form for the private interface of fgt1 (IP from security_vpc_private_subnet)"
  default = "10.0.3.11/24"
}
variable "fgt1_hamgmt_ip" {
  description = "Provide the IP address in CIDR form for the ha mgmt interface of fgt1 (IP from security_vpc_hamgmt_subnet)"
  default = "10.0.5.11/24"
}
variable "fgt2_public_ip" {
  description = "Provide the IP address in CIDR form for the public interface of fgt2 (IP from security_vpc_public_subnet)"
  default = "10.0.2.11/24"
}
variable "fgt2_private_ip" {
  description = "Provide the IP address in CIDR form for the private interface of fgt2 (IP from security_vpc_private_subnet)"
  default = "10.0.4.11/24"
}
variable "fgt2_hamgmt_ip" {
  description = "Provide the IP address in CIDR form for the ha mgmt interface of fgt2 (IP from security_vpc_hamgmt_subnet)"
  default = "10.0.6.11/24"
}
variable "tag_name_prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default = "stack-1"
}
variable "tag_name_unique" {
  description = "Provide a unique tag prefix value that will be used in the name tag for each modules resources"
  default = "automatically handled by terraform modules"
}
variable "tgw_creation" {
  description = "Provide a 'yes' to deply a new TGW and configure the security VPC and fgts accordingly, otherwise leave as 'no'"
  default = "no"
}
variable "spoke_vpc1_cidr" {
  description = "Provide the network CIDR for the VPC"
  default = "10.1.0.0/16"
}
variable "spoke_vpc1_private_subnet_cidr1" {
  description = "Provide the network CIDR for the private subnet1 in spoke vpc1"
  default = "10.1.0.0/24"
}
variable "spoke_vpc1_private_subnet_cidr2" {
  description = "Provide the network CIDR for the private subnet2 in spoke vpc1"
  default = "10.1.1.0/24"
}
variable "spoke_vpc2_cidr" {
  description = "Provide the network CIDR for the VPC"
  default = "10.2.0.0/16"
}
variable "spoke_vpc2_private_subnet_cidr1" {
  description = "Provide the network CIDR for the private subnet1 in spoke vpc2"
  default = "10.2.0.0/24"
}
variable "spoke_vpc2_private_subnet_cidr2" {
  description = "Provide the network CIDR for the private subnet2 in spoke vpc2"
  default = "10.2.1.0/24"
}