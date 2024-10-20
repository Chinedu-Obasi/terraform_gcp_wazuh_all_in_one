#!/bin/bash

# Update package list and install required packages
apt-get update
apt-get install -y wget curl

# All-in-one installation of the Wazuh Server [Indexer, Server and Dashboard in one server]
curl -sO https://packages.wazuh.com/4.7/wazuh-install.sh && sudo bash ./wazuh-install.sh -a


# Enable and start Wazuh service
systemctl enable wazuh-manager
systemctl start wazuh-manager

