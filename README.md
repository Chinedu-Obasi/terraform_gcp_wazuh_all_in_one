# Terraform+Wazuh+GCP all-in-one Installation

All-in-one installation of the Wazuh Server [Indexer, Server and Dashboard in one server] and Wazuh agents on GCP with VM instances.

![Terraform + AWS + Wazuh](link_to_your_image_here)

## Structure

```bash
├── 0-providers.tf <- AWS config
├── 1-ami.tf <- AMI Base
├── 2-key_resources.tf <- .pem and .pem.pub generation
├── 3-security_group.tf <- security groups


├── 0-providers.tf <- AWS config
├── 1-ami.tf <- AMI Base
├── 2-key_resources.tf <- .pem and .pem.pub generation
├── 3-security_group.tf <- security groups
