resource "proxmox_vm_qemu" "vm" {
  name        = var.name
  target_node = var.target_node
  clone       = var.vm_template_name
  desc        = var.description
  agent       = 1

  cores  = var.cpu_cores
  memory = var.memory
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = var.disk_size
  }
  network {
    model  = "virtio"
    bridge = var.network_bridge
  }

  connection {
    type        = "ssh"
    user        = "terraform"
    private_key = file(var.ssh_key_path)
    host        = self.default_ipv4_address
  }
  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${var.name}",
      "sudo dhclient -r",
      "sudo dhclient"
    ]
  }
}
