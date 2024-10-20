# Terraform+Wazuh+GCP all-in-one Installation

All-in-one installation of the Wazuh SIEM [Indexer, Server and Dashboard in one server] and Wazuh agents on GCP with VM instances.

![Terraform + GCP + Wazuh](link_to_your_image_here)

- Deploy a GCP project and assign the necessary roles and permissions.
- Use the GCP credentials generated in the Terraform configuration files.
- By default the Terraform configuration deploys 1 (one) Ubuntu 22.04 LTS Wazuh server and 2 (two) Ubuntu 22.04 LTS Wazuh agents (You can customize the OS type and number of agents).

## Structure

```bash
├── 0-providers.tf <- AWS config
├── 1-ami.tf <- AMI Base
├── 2-key_resources.tf <- .pem and .pem.pub generation
├── 3-security_group.tf <- security groups


├── configure-indexer.yml <- indexer installation process
├── configure-server.yml <- server installation process
├── configure-dashboard.yml <- dashboard installation commands
```

## Usage
![Create your GCP project and set up Roles, APIs and Service Account](https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one/blob/main/GCP%20Initial%20Setup.md)
