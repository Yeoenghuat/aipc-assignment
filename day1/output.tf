#--- digitalocean ---
output "aipc_ssh_key_pub" {
  value = data.digitalocean_ssh_key.sshkey.fingerprint
}

output "aipc_ssh_key_id" {
  value = data.digitalocean_ssh_key.sshkey.id
}

output "nginx_ip" {
  value = digitalocean_droplet.nginx.ipv4_address
}

#--- docker ---
output "dov-bear-md5" {
  value       = data.docker_image.dov-bear.repo_digest
  description = "SHA of the image"
}

output "container-names" {
  value = [for container in docker_container.dov-bear-containers-count : container.name]
}