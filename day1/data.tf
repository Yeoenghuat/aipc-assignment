#--- digitalocean ---
data digitalocean_ssh_key sshkey {
	name = "pubkey"
}

#--- docker ---
data "docker_image" "dov-bear" {
  name = "chukmunnlee/dov-bear:v2"
}