# FortiOS FGCP AP HA (Dual AZ) in AWS

For detailed documentation on FGCP in AWS, how to use these templates, walk through of a deployment, and additional use cases, please reference [FGCP](https://fortinetcloudcse.github.io/FGCP-AWS).

For other documentation needs such as FortiOS administration, please reference [docs.fortinet.com](https://docs.fortinet.com/). 

## Prerequisites
Before attempting to create a stack with the templates, a few prerequisites should be checked to ensure a successful deployment:
1.	An AMI subscription must be active for the FortiGate license type being used in the template.
  * [Intel BYOL Marketplace Listing](https://aws.amazon.com/marketplace/pp/prodview-lvfwuztjwe5b2)
  * [Intel PAYG Marketplace Listing](https://aws.amazon.com/marketplace/pp/prodview-wory773oau6wq)
  * [ARM BYOL Marketplace Listing](https://aws.amazon.com/marketplace/pp/prodview-ccnrlwz74uwgk)
  * [ARM PAYG Marketplace Listing](https://aws.amazon.com/marketplace/pp/prodview-ohcnwr7nr2icy)
2.	The solution requires 3 EIPs to be created so ensure the AWS region being used has available capacity.  Reference [AWS Documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html) for more information on EC2 resource limits and how to request increases.
3.	If BYOL licensing is to be used, ensure these licenses have been registered on the support site.
4.  **Ensure that all of the PublicSubnet's and HAmgmtSubnet's AWS route tables have a default route to an AWS Internet Gateway.**  Reference [AWS Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html#route-tables-internet-gateway) for further information.  Otherwise you must set the variable **only_private_ec2_api** to **'yes'**.

Once the prerequisites have been satisfied proceed with the deployment steps below.

## Deployment
1.  Clone this repo with the command below.
```
git clone https://github.com/hgaberra/fortigate-aws-ha-dualaz-terraform.git
```

2.  Change directories and modify the terraform.tfvars file with your credentials and deployment information. **Note** the comments explaining what inputs are expected for the variables. For further details on given variable, reference the variables.tf file.
```
cd fortigate-aws-ha-dualaz-terraform
nano terraform.tfvars
```

3.  When ready to deploy, use the commands below to run through the deployment.
```
terraform init
terraform apply --auto-approve
```

4.  When the deployment is complete, you will see login information for the FortiGates like so.
```
Apply complete! Resources: 37 added, 0 changed, 0 destroyed.

Outputs:

fgt_login_info = <<EOT

  # fgt username: admin
  # fgt initial password: i-02a665023769e127d
  # cluster login url: https://184.169.245.204
  
  # fgt1 login url: https://54.67.114.34
  # fgt2 login url: https://52.53.78.194
  
  # tgw_creation: no

EOT
```
