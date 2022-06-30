output nginx_ip {
    value = digitalocean_droplet.mycodeserver.ipv4_address
}

# output "dockerip" {
#     value = data.digitalocean_droplet.docker_host.ipv4_address
# }