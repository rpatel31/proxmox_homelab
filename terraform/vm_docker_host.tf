resource "proxmox_virtual_environment_vm" "docker_host" {
  node_name = var.proxmox_node
  name = "docker-host"
  vm_id = 100

  clone {
    vm_id = 9000
    full = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 4096
  }

  disk{
    datastore_id = "local-lvm"
    interface = "scsi0"
    size = 20
  }

  network_device {
    
    bridge = "vmbr0"
  }

  initialization {
    ip_config {
      ipv4{
        address = "${var.vm_docker_host_ip}/24"
        gateway = var.default_gateway
      }
    }

    user_account {
      username = var.vm_docker_host_username
      keys = [var.ssh_public_key]
    }
  }

  agent {
    enabled = true
  }
}