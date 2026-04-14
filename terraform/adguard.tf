resource "proxmox_virtual_environment_container" "adguard"{
    node_name = var.proxmox_node
    vm_id = 300
    description = "Adguard Home DNS AD BLOCK"
    started = true

    unprivileged = true
    features {
        nesting = true
    }

    initialization {
        hostname = "adguard"

        ip_config{
            ipv4{
                address = "${var.adguard_ip}/24"
                gateway = "192.168.1.1"
            }
        }

        user_account{
            keys = [var.ssh_public_key]
            password = var.adguard_password
        }
    }

    network_interface{
        name= "eth0"
        bridge = "vmbr0"
    }

    disk {
        datastore_id = "local-lvm"
        size = 4
    }

    operating_system{
        template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
        type = "ubuntu"
    }

    cpu{
        cores = 1
    }

    memory {
        dedicated = 1024
        swap = 512
    }
}

output "adgaurd_ip"{
    value = var.adguard_ip
    description = "AdGuard Home IP Address"
}