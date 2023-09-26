provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}

module "security-vpc" {
  source = ".//modules/aws/vpc-security-tgw"
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
  
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
  vpc_cidr = var.security_vpc_cidr
  public_subnet_cidr1 = var.security_vpc_public_subnet_cidr1
  public_subnet_cidr2 = var.security_vpc_public_subnet_cidr2
  private_subnet_cidr1 = var.security_vpc_private_subnet_cidr1
  private_subnet_cidr2 = var.security_vpc_private_subnet_cidr2
  hamgmt_subnet_cidr1 = var.security_vpc_hamgmt_subnet_cidr1
  hamgmt_subnet_cidr2 = var.security_vpc_hamgmt_subnet_cidr2
  tgwattach_subnet_cidr1 = var.security_vpc_tgwattach_subnet_cidr1
  tgwattach_subnet_cidr2 = var.security_vpc_tgwattach_subnet_cidr2
  fgt1_eni1_id = module.fgcp-ha.fgt1_eni1_id
  tag_name_prefix = var.tag_name_prefix
  tag_name_unique = "security"
  tgw_creation = var.tgw_creation

  # to attach this security VPC to a new TGW, delete or comment out the next three lines
  # otherwise leave uncommented
  transit_gateway_id = ""
  tgw_spoke_route_table_id = ""
  tgw_security_route_table_id = ""

  # to attach this security VPC to a new TGW, uncomment the next three lines 
  # otherwise leave commented out 
  #transit_gateway_id = module.transit-gw.tgw_id
  #tgw_spoke_route_table_id = module.transit-gw.tgw_spoke_route_table_id
  #tgw_security_route_table_id = module.transit-gw.tgw_security_route_table_id
}

module "fgcp-ha" {
  source = ".//modules/ftnt/fgt-fgcp-ap"
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region

  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
  vpc_id = module.security-vpc.vpc_id
  vpc_cidr = var.security_vpc_cidr
  public_subnet1_id = module.security-vpc.public_subnet1_id
  private_subnet1_id = module.security-vpc.private_subnet1_id
  hamgmt_subnet1_id = module.security-vpc.hamgmt_subnet1_id
  public_subnet2_id = module.security-vpc.public_subnet2_id
  private_subnet2_id = module.security-vpc.private_subnet2_id
  hamgmt_subnet2_id = module.security-vpc.hamgmt_subnet2_id

  cidr_for_access = var.cidr_for_access
  keypair = var.keypair
  encrypt_volumes = var.encrypt_volumes
  instance_type = var.instance_type
  only_private_ec2_api = var.only_private_ec2_api
  fortios_version = var.fortios_version
  license_type = var.license_type
  fgt1_byol_license = var.fgt1_byol_license
  fgt2_byol_license = var.fgt2_byol_license
  fgt1_fortiflex_token = var.fgt1_fortiflex_token
  fgt2_fortiflex_token = var.fgt2_fortiflex_token
  public_subnet1_intrinsic_router_ip = var.security_vpc_public_subnet1_intrinsic_router_ip
  private_subnet1_intrinsic_router_ip = var.security_vpc_private_subnet1_intrinsic_router_ip
  hamgmt_subnet1_intrinsic_router_ip = var.security_vpc_hamgmt_subnet1_intrinsic_router_ip
  public_subnet2_intrinsic_router_ip = var.security_vpc_public_subnet2_intrinsic_router_ip
  private_subnet2_intrinsic_router_ip = var.security_vpc_private_subnet2_intrinsic_router_ip
  hamgmt_subnet2_intrinsic_router_ip = var.security_vpc_hamgmt_subnet2_intrinsic_router_ip
  tag_name_prefix = var.tag_name_prefix

  fgt1_public_ip = var.fgt1_public_ip
  fgt1_private_ip = var.fgt1_private_ip
  fgt1_hamgmt_ip = var.fgt1_hamgmt_ip

  fgt2_public_ip = var.fgt2_public_ip
  fgt2_private_ip = var.fgt2_private_ip
  fgt2_hamgmt_ip = var.fgt2_hamgmt_ip

  tgw_creation = var.tgw_creation
  spoke_vpc1_cidr = var.spoke_vpc1_cidr
  spoke_vpc2_cidr = var.spoke_vpc2_cidr
}

# To deploy a new TGW and two new spoke VPCs, uncomment each of the three modules below
/*
module "transit-gw" {
  source = ".//modules/aws/tgw"
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
  tag_name_prefix = var.tag_name_prefix
}
*/

/*
module "spoke-vpc1" {
  source = ".//modules/aws/vpc-spoke-tgw"
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
  
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
  vpc_cidr = var.spoke_vpc1_cidr
  private_subnet_cidr1 = var.spoke_vpc1_private_subnet_cidr1
  private_subnet_cidr2 = var.spoke_vpc1_private_subnet_cidr2
  transit_gateway_id = module.transit-gw.tgw_id
  tgw_spoke_route_table_id = module.transit-gw.tgw_spoke_route_table_id
  tgw_security_route_table_id = module.transit-gw.tgw_security_route_table_id
  tag_name_prefix = var.tag_name_prefix
  tag_name_unique = "spoke1"
}
*/

/*
module "spoke-vpc2" {
  source = ".//modules/aws/vpc-spoke-tgw"
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
  
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
  vpc_cidr = var.spoke_vpc2_cidr
  private_subnet_cidr1 = var.spoke_vpc2_private_subnet_cidr1
  private_subnet_cidr2 = var.spoke_vpc2_private_subnet_cidr2
  transit_gateway_id = module.transit-gw.tgw_id
  tgw_spoke_route_table_id = module.transit-gw.tgw_spoke_route_table_id
  tgw_security_route_table_id = module.transit-gw.tgw_security_route_table_id
  tag_name_prefix = var.tag_name_prefix
  tag_name_unique = "spoke2"
}
*/