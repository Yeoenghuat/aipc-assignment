data "digitalocean_droplet" "docker_host" {
  name = "aipc-eh"
}

data digitalocean_ssh_key pubkey {
    name = "pubkey"
}

data docker_image dov-bear {
    name = "chukmunnlee/dov-bear:v2"
}