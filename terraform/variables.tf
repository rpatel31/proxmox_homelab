variable "proxmox_url" {
    type = string
    description = "Proxmox API Url"
}

variable "proxmox_node" {
    type = string
    description = "Proxmox Node Name"
    default = "pve"
}

variable "proxmox_token_id" {
    type = string
    description = "Proxmox API Token ID"
}

variable "proxmox_token_secret" {
    type = string
    sensitive = true
    description = "Proxmox API Token Secret"
}

variable "default_gateway"{
    type = string
    description = "router gateway"
}

variable "ssh_public_key" {
    type = string
    description = "SSH Public Key of Lxc and VM Access"
}

variable adguard_ip{
    type = string
    description = "IP for Adgaurd"
}

variable "adguard_password" {
    type = string
    sensitive = true
    description = "password for AdGuard LXC"
}

variable "vm_docker_host_username" {
    type = string
    description = "username for docker vm host"
}

variable vm_docker_host_ip{
    type = string
    description = "IP for docker VM"
}

