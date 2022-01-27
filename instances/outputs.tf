output "vm_ip_address" {
  description = "IP Address of VM"
  value       = { for machine in proxmox_vm_qemu.vm[*] : machine.name => machine.default_ipv4_address }
}
