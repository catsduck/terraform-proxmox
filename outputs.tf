output "vm_ip_addresses" {
  description = "IP Addresses of VMs"
  value       = module.instances_ubuntu[*].vm_ip_address
}
