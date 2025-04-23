variable "proxmox_api_url" {}
variable "proxmox_token_id" {}
variable "proxmox_token_secret" {}
variable "target_node" {}
variable "template_name" {}
variable "storage" {}
variable "network_bridge" {}
variable "nameserver" {}
variable "ssh_public_key" {}

variable "vms" {
  type = map(object({
    ip      = string
    gateway = string
    cores   = number
    memory  = number
    disk_size  = string
    storage    = string
  }))
}
