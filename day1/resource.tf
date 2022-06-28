#--- digitalocean ---
resource "local_file" "pub-key" {
  filename        = "mykey.pub"
  content         = data.digitalocean_ssh_key.sshkey.public_key
  file_permission = "0644"
}

resource "digitalocean_droplet" "nginx" {
  name     = "nginx"
  image    = var.DO_image
  size     = var.DO_size
  region   = var.DO_region
  ssh_keys = [data.digitalocean_ssh_key.sshkey.id]
  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.DO_private_key)
    host        = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "apt update",
      "apt install nginx -y",
      "systemctl enable nginx",
      "systemctl start nginx"
    ]
  }
}


resource "local_file" "root_at_nginx" {
  content  = ""
  filename = "root@${digitalocean_droplet.nginx.ipv4_address}"
}


#--- docker ---
resource "docker_container" "dov-bear-container" {
  name  = "dov-bear"
  image = data.docker_image.dov-bear.id
  env = [
    "INSTANCE_NAME=myapp-OG",
    "INSTANCE_HASH=hash_123"
  ]
  ports {
    internal = 3000
    external = 7999
  }
}

resource "docker_container" "dov-bear-containers-count" {
  count = length(var.ports)
  name  = "dov-bear-${var.ports[count.index]}"
  image = data.docker_image.dov-bear.id
  env = [
    "INSTANCE_NAME=myapp-${var.ports[count.index]}",
    "INSTANCE_HASH=hash_123"
  ]
  ports {
    internal = 3000
    external = var.ports[count.index]
  }
}

resource "docker_container" "dov-bear-containers-foreach" {
  for_each = var.containers
  name     = each.key
  image    = data.docker_image.dov-bear.id
  env = [
    "INSTANCE_NAME=myapp-${each.key}",
    "INSTANCE_HASH=hash_123"
  ]
  ports {
    internal = 3000
    external = each.value.external-port
  }
}

resource "local_file" "container_name" {
  content         = join(", ", [for container in docker_container.dov-bear-containers-count : container.name])
  filename        = "container_list.txt"
  file_permission = "0644"
}

