resource local_file root_at_nginx {
    content = ""
    filename = "root@${digitalocean_droplet.nginx.ipv4_address}"
}

resource docker_container dov-bear-container {
    count = var.app_instances
    name = "dov-bear-${count.index}"
    image = data.docker_image.dov-bear.id
    env = [
        "INSTANCE_NAME=myapp-${count.index}",
        "INSTANCE_HASH=${count.index}"
    ]
    ports {
        internal = 3000
    }
}

/* ---- nginx --- */
resource digitalocean_droplet nginx {
    name = "nginx"
    image = var.DO_image
    size = var.DO_size
    region = var.DO_region
    ssh_keys = [ data.digitalocean_ssh_key.pubkey.id ]
    connection {
        type = "ssh"
        user = "root"
        private_key = file(var.DO_private_key)
        host = self.ipv4_address
    }
    provisioner remote-exec {
        inline = [
            "apt update",
            "apt install nginx -y",
            "systemctl enable nginx",
            "systemctl start nginx"
        ]
    }

    provisioner file {
        source = "./nginx.conf"
        destination = "/etc/nginx/nginx.conf"
      
    }

    provisioner remote-exec {
        inline = [
            "systemctl restart nginx"
        ]
    }
}

resource local_file nginx-conf {
    depends_on = [
        docker_container.dov-bear-container
    ]
    content = templatefile("nginx.conf.tpl", {
        host_ip = data.digitalocean_droplet.docker_host.ipv4_address
        container_ports = docker_container.dov-bear-container[*].ports[0].external
    })
    filename = "nginx.conf"
    file_permission = "0444"
}