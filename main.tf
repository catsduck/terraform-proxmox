module "instances_ubuntu" {
  source           = "./instances"
  count            = 3
  name             = "ubuntu${count.index + 1}"
  description      = "Instance created via Terraform"
  target_node      = local.proxmox_node
  vm_template_name = "ubuntu-base"
  cpu_cores        = 2
  memory           = 4096
  disk_size        = "30G"
  network_bridge   = local.network_bridge
  ssh_key_path     = var.ssh_key_path
}
