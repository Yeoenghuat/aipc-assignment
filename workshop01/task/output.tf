output nginx_ip {
    value = digitalocean_droplet.nginx.ipv4_address
}

output container_ports {
    value = docker_container.dov-bear-container[*].ports[0].external
}

output "dockerip" {
    value = data.digitalocean_droplet.docker_host.ipv4_address
}