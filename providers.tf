terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}


provider "proxmox" {
  pm_api_url = "https://192.168.1.4:8006/api2/json"
}
