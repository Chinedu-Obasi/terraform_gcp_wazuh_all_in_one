# Terraform+Wazuh+GCP all-in-one Installation

All-in-one installation of the Wazuh SIEM [Indexer, Server and Dashboard in one server] and Wazuh agents on GCP with VM instances.

![Terraform + GCP + Wazuh](link_to_your_image_here)

- Deploy a GCP project and assign the necessary roles and permissions.
- Use the GCP credentials generated in the Terraform variable configuration file.
- By default the Terraform configuration deploys 1 (one) Ubuntu 22.04 LTS Wazuh server and 2 (two) Ubuntu 22.04 LTS Wazuh agents (You can customize the OS type and number of agents).

## Structure

```bash
├── main.tf <- GCP Terraform initialization, Firewall rules, Server and agents instance configuration.
├── outputs.tf <- Output of Wazuh Server and agents IPs
├── terraform.tfvars <- GCP Credentials for Wazuh deployment
├── variables.tf <- Variable definitions.


├── wazuh_server_setup.sh <- Wazuh Server setup script
├── gcp_project_setup.md <- Steps to create a GCP project, service account and assign required roles.
```

## Usage
![Create your GCP project and set up Roles, APIs and Service Account](https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one/blob/main/GCP%20Initial%20Setup.md)

- Clone the repository, change into working directory.

```bash
git clone https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one.git
cd terraform_gcp_wazuh_all_in_one
```
- Edit the following variables in terraform.tfvars file with the GCP credentials: project_id, credentials_file, region, zone, service_account_email.
- {Optional} Edit Server & agent instance types, OS image, Number of to be deployed agents in variables.tf.

 ```bash
terraform init
terraform plan
terraform apply
```
