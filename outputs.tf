output "wazuh_server_ip" {
  description = "Public IP of the Wazuh server"
  value       = google_compute_instance.wazuh_server.network_interface[0].access_config[0].nat_ip
}

output "wazuh_agent_ips" {
  description = "Public IPs of the Wazuh agents"
  value       = google_compute_instance.wazuh_agents[*].network_interface[0].access_config[0].nat_ip
}
