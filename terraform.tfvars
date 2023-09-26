/*
Please update the example values here to override the default values in vaariables.tf.
Any variables in variables.tf can be overriden here.
Overriding variables here keeps the variables.tf as a clean local reference.
*/

# Provide the credentials to access the AWS account
access_key = ""
secret_key = ""

# Specify the region and AZs to use.
region = "us-west-1"
availability_zone1 = "us-west-1a"
availability_zone2 = "us-west-1b"

# Specify the name of the keypair that the FGTs will use.
keypair = ""

# Specify the CIDR block which you will be logging into the FGTs from.
cidr_for_access = "0.0.0.0/0"

# Specify a tag prefix that will be used to name resources.
tag_name_prefix = ""

# Specify the FortiOS version to use 7.0, 7.2, or 7.4
fortios_version = "7.2"

/*
For license_type, specify byol, flex, or payg.

To use traditional byol license files, place the license files in this root directory (same as this file) and specify the file names.
Otherwise, leave these as empty strings.
fgt1_byol_license = "fgt1-license.lic"
fgt2_byol_license = "fgt2-license.lic"

To use FortiFlex tokens, please provide the token values like so.
Otherwise, leave these as empty strings.
fgt1_fortiflex_token = "1A2B3C4D5E6F7G8H9I0J"
fgt2_fortiflex_token = "2B3C4D5E6F7G8H9I0J1K"
*/
license_type = "payg"
fgt1_byol_license = ""
fgt2_byol_license = ""
fgt1_fortiflex_token = ""
fgt2_fortiflex_token = ""

# To deploy a new TGW and two spoke VPCs, specify 'yes'
# NOTE... you will need to modify the main.tf file, reference comments for further info
tgw_creation = "no"