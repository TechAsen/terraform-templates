terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = ">= 2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "vm" {
  for_each    = var.vms

  name        = each.key
  target_node = var.target_node
  clone       = var.template_name

  os_type     = "cloud-init"
  cores       = each.value.cores
  memory      = each.value.memory
  sockets     = 1
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    size    = "10G"
    type    = "scsi"
    storage = var.storage
  }

  network {
    model  = "virtio"
    bridge = var.network_bridge
  }

  ipconfig0  = "ip=${each.value.ip}/24,gw=${each.value.gateway}"
  nameserver = var.nameserver

  ciuser     = "ansible"
  sshkeys    = var.ssh_public_key
}
