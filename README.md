# Terraform+Wazuh+GCP all-in-one Installation

All-in-one installation of the Wazuh SIEM version [Indexer, Server and Dashboard in one server] and Wazuh agents on GCP with VM instances.

![Terraform + GCP + Wazuh](https://github.com/user-attachments/assets/03fdeb9d-2f49-46ac-a2a6-fe653a41d7d1)

- Deploy a GCP project and assign the necessary roles and permissions.
- Use the GCP credentials generated in the Terraform variable configuration file.
- By default the Terraform configuration files deploys 1 (one) Ubuntu 22.04 LTS Wazuh server and 2 (two) Ubuntu 22.04 LTS Wazuh agents (You can customize the OS type and number of agents).

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
- Retrieve Wazuh Server IP and Dashboard Credentials after start-up script installation from GCP Console [Wazuh Server should be ready in 10-15 minutes]

```bash
├── Compute Engine -> VM Instances -> Wazuh-Server -> SSH or Access the Server using any SSH client
sudo -i   # Access the VM as a root user
cd /      # Change directory to the root folder
tar -O -xvf wazuh-install-files.tar wazuh-install-files/wazuh-passwords.txt   # Use the Admin user for the web user interface and Wazuh indexer to access the dashboard.
```
- Access the Wazuh Dashboard and use the Deploy Wazuh Agent Option to deploy the Wazuh agents 

```bash
https:<wazuh-server-ip>  # If certificates are installed correctly, you should have access to the dashboard on port 443.

**Below is a sample installation command for a Debian-64 agent in version 4.7...**
sudo wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.7.5-1_amd64.deb && sudo WAZUH_MANAGER='<Wazuh-Server-IP>' WAZUH_AGENT_NAME='<Wazuh-agent-name>' dpkg -i ./wazuh-agent_4.7.5-1_amd64.deb

sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
```
### Wazuh Modules Dashboard
![Wazuh+Dashboard](https://github.com/user-attachments/assets/b3c4ab3d-78b6-4d5c-903c-9b5fcf882bef)

### Wazuh MITRE ATTACK Dashboard
![Wazuh+MITRE+Dashboard](https://github.com/user-attachments/assets/4b1a046c-3ce7-4cd3-a423-354e308093e3)

### Wazuh Security Events Dashboard
![Wazuh++SE+Dashboard](https://github.com/user-attachments/assets/93e7d6f4-ed44-435e-8559-85f283406e85)

### Wazuh PCI DSS Dashboard
![Wazuh+PCI+Dashboard](https://github.com/user-attachments/assets/baec6d9b-b437-4921-ab9a-626b4b54cae9)

### Wazuh NIST 800-53 Dashboard
![Wazuh+NIST+Dashboard](https://github.com/user-attachments/assets/fc61f56b-bd98-467c-ba9f-5bef13d6d772)
