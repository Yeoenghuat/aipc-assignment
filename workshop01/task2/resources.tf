resource "docker_image" "myapp-image" {
  name = "${var.nwapp_image.image_name}:${var.nwapp_image.image_tag}"
}

resource "docker_image" "mysql-image" {
  name = "${var.nwdb_image.image_name}:${var.nwdb_image.image_tag}"
}

resource "docker_network" "mynet" {
  name = var.mynetwork_name
}

resource "docker_volume" "mysql-vol" {
  name = var.mysql_vol_name
}

resource "docker_container" "mysql" {
  name  = var.mysql_name
  image = docker_image.mysql-image.latest

  networks_advanced {
    name = docker_network.mynet.name
  }

  volumes {
    volume_name    = docker_volume.mysql-vol.name
    container_path = "/var/lib/mysql"
  }
}

resource "docker_container" "myapp" {
  name  = var.myapp_name
  image = docker_image.myapp-image.latest

  ports {
    internal = "3000"
    external = "8086"
  }

  networks_advanced {
    name = docker_network.mynet.name
  }

  env = [
    "DB_USER=${var.mysql_user}",
    "DB_PASSWORD=${var.mysql_pass}",
    "DB_HOST=${var.mysql_name}"
  ]

}