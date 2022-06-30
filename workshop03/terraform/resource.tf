resource digitalocean_droplet mycodeserver {
    name = "mycodeserver"
    image = data.digitalocean_image.code-server-image.id
    size = var.DO_size
    region = var.DO_region
    ssh_keys = [ data.digitalocean_ssh_key.pubkey.id ]
}

resource local_file ansible-inventory {
    content = templatefile("template_files/inventory.yaml.tpl", {
        ansible_host = digitalocean_droplet.mycodeserver.ipv4_address
        ansible_user = var.ansible_user
        ansible_private_key = var.ansible_private_key
        code_server_pwd = var.code_server_pwd
    })
    filename = "../ansible/inventory.yaml"
    file_permission = "0444"
}