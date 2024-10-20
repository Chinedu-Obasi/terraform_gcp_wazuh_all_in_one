terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.7.0"
    }
  }
}

provider "google" {
  credentials = file("${var.credentials_file}")  # Point to your JSON key file
  project     = var.project_id
  region      = var.region
  
}

# Create firewall rule for SSH and Wazuh communication
resource "google_compute_firewall" "default" {
  name    = "allow-ssh-https-and-wazuh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "443", "1514", "1515"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allows traffic from any IP range (this is for testing not production)
}


# Create Wazuh server instance
resource "google_compute_instance" "wazuh_server" {
  name         = "wazuh-server"
  machine_type = var.server_instance_type   
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"     #Select the image name/family as needed
      size = 20 # This is the minimum disk size to be used, specified in GB
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = file("wazuh_server_setup.sh")
}

# Create Wazuh agent instances
resource "google_compute_instance" "wazuh_agents" {
  count        = var.wazuh_instance_count
  name         = "wazuh-agent-${count.index + 1}"
  machine_type = var.agent_instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"     #Select the instance image/family as needed
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  
}
