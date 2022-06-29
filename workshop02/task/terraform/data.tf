data "digitalocean_droplet" "docker_host" {
  name = "aipc-eh"
}

data digitalocean_ssh_key pubkey {
    name = "pubkey"
}