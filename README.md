# Terraform+Wazuh+GCP all-in-one Installation

All-in-one installation of the Wazuh SIEM version 4.7 [Indexer, Server and Dashboard in one server] and Wazuh agents on GCP with VM instances.

![Terraform + GCP + Wazuh](https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one/blob/main/Terraform%2BGCP%2BWazuh.png)

- Deploy a GCP project and assign the necessary roles and permissions.
- Use the GCP credentials generated in the Terraform variable configuration file.
- By default the Terraform configuration files deploys 1 (one) Ubuntu 22.04 LTS Wazuh server and 2 (two) Ubuntu 22.04 LTS Wazuh agent server (You can customize the OS type and number of agents).

## Structure

```bash
├── main.tf <- GCP Terraform initialization, Firewall rules, Server and agents instance configuration.
├── outputs.tf <- Output of Wazuh Server and agents IPs
├── terraform.tfvars <- GCP Credentials for Wazuh deployment
├── variables.tf <- Variable definitions.


├── wazuh_server_setup.sh <- Wazuh Server startup script [deploys after instance creation]
├── gcp_project_setup.md <- Steps to create a GCP project, service account and assign required roles.
```

## Usage
- [Create your GCP project and set up Roles, APIs and Service Account](https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one/blob/main/gcp_project_setup.md)

- Clone the repository, change into working directory.

```bash
git clone https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one.git
cd terraform_gcp_wazuh_all_in_one
```
- Edit the following variables in terraform.tfvars file with the GCP credentials: project_id, credentials_file, region, zone, service_account_email.
- {Optional} Edit Server & agent instance types, OS image, Number of to be deployed agents in variables.tf file.

 ```bash
terraform init
terraform plan
terraform apply
```
- Retrieve Wazuh Server IP and Dashboard Credentials after start-up script installation from GCP Console [Wazuh Server should be ready in 6-10 minutes]

```bash
├── Compute Engine -> VM Instances -> Wazuh-Server -> Serial Port 1 Console [you can refresh & monitor the deployment progress from here]
├── Locate the line - INFO: You can access the web interface https://<wazuh-dashboard-ip>:443, and note the User and Password credentials.
```
- Access the Wazuh Dashboard and deploy Wazuh agent on the instances [Follow the prompts and run the scripts in the Bash terminal with root privileges on Wazuh agent instances]

```bash
sudo wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.7.5-1_amd64.deb && sudo WAZUH_MANAGER='<Wazuh-Server-IP>' WAZUH_AGENT_NAME='<Wazuh-agent-name>' dpkg -i ./wazuh-agent_4.7.5-1_amd64.deb
sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
```
### Wazuh Modules Dashboard
![Wazuh+Dashboard](https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one/blob/main/wazuh_dashboard.png)

### Wazuh MITRE ATTACK Dashboard
![Wazuh+MITRE+Dashboard](https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one/blob/main/wazuh_MITRE_Attack.png)

### Wazuh Security Events Dashboard
![Wazuh++SE+Dashboard](https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one/blob/main/wazuh_security_events.png)

### Wazuh PCI DSS Dashboard
![Wazuh+PCI+Dashboard](https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one/blob/main/wazuh_PCI_DSS_dashboard.png)

### Wazuh NIST 800-53 Dashboard
![Wazuh+NIST+Dashboard](https://github.com/Chinedu-Obasi/terraform_gcp_wazuh_all_in_one/blob/main/wazuh_NIST_800_53.png)
