#--- digitalocean ---
output aipc_ssh_key_pub {
    value = data.digitalocean_ssh_key.sshkey.fingerprint
}

output aipc_ssh_key_id {
    value = data.digitalocean_ssh_key.sshkey.id
}

#--- docker ---
output dov-bear-md5 {
    value = data.docker_image.dov-bear.repo_digest
    description = "SHA of the image"
}