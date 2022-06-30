output code_server_ip {
    value = digitalocean_droplet.mycodeserver.ipv4_address
}

output code_server_url {
    value = "code-${digitalocean_droplet.mycodeserver.ipv4_address}.nip.io"
}
