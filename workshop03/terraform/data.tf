# data "digitalocean_droplet" "docker_host" {
#   name = "aipc-eh"
# }

data digitalocean_ssh_key pubkey {
    name = "pubkey"
}

data "digitalocean_image" "code-server-image" {
  name = "mycodeserver-${var.code_server_version}"
}