proxmox_api_url      = "https://proxmox.local:8006/api2/json"
proxmox_token_id     = "root@pam!terraform"
proxmox_token_secret = "my-secret-token"
target_node          = "pve"
template_name        = "ubuntu-cloudinit-template"
storage              = "local-lvm"
network_bridge       = "vmbr0"
nameserver           = "8.8.8.8"
ssh_public_key       = "ssh-rsa AAAAB3... user@machine"

vms = {
  "vm-web01" = {
    ip      = "192.168.1.101"
    gateway = "192.168.1.1"
    cores   = 2
    memory  = 2048
  },
  "vm-db01" = {
    ip      = "192.168.1.102"
    gateway = "192.168.1.1"
    cores   = 4
    memory  = 4096
  }
}
