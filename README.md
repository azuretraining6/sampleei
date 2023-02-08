# dsi-oon-ei-az-tf
terraform for deploying E&amp;I Azure infrastructure

This repo is used for deploying the azure cloud infrastructure neccessay for the E&I OON project.

| Cloud Component | Usage           |
|-----------------| --------------- |
| Databricks Workspace | Used to scala job on data |
| Data Factory | Used for data orchestration |
| Storage Accounts | Used for storaging data |
| Key Vault | Used to store sensitive values |
| Virtual Network and Subnet | Prevents unauthorised access |
| SQL Server and Database | Used for data storage, to be access by databricks |
| App Service | Used to an API |
| Container Registry | Used to store container images |

# Prerequisite 
1. Create a service principal with owner access to the subscription following the steps found [here](https://github.optum.com/CommercialCloud-EAC/azure_starter#set-up-azure-service-principal-automation-user-for-terraform)
2. Grant Directory.Read.All permission to the service principal following the steps found [here](https://cloud.optum.com/docs/technical-guides/azure-service-account/#granting-permissions-for-owner-service-principal)

# Deployment

The terraform deployment is done through a GitHub Action running on a docker container in the `uhg-runner` farm via an Azure Service Principal with Owner level access on the subscription. The GitHub Action runs the following steps:
1. Checkout the repository code base.
2. Az CLI Login.
3. Run bootstrap bash script for creating resource group and storage account for the terraform state.
4. Create an environment variable for the storage account access key created in the previous steps called `ARM_ACCESS_KEY`. This is needed for running terraform as an Azure service principal.
5. Set git config to use MSID and PAT in `https://github.com` url. This is needed for terraform init to pull module sources from the uhg-internal GHEC organisation.
6. Terraform init with backend configuration arguments `-backend-config dev/backend.tf`.
7. Terraform plan with passed in variables file `--var-file dev/variables.tfvars -out tfplan`.
8. Terraform apply the `tfplan` from the previous step.
