#--- digitalocean ---
resource local_file pub-key{
    filename = "mykey.pub"
    content = data.digitalocean_ssh_key.sshkey.public_key
    file_permission = "0644"
}

#--- docker ---
resource docker_container dov-bear-container {
    name = "dov-bear"
    image = data.docker_image.dov-bear.id
    env = [
        "INSTANCE_NAME=myapp",
        "INSTANCE_HASH=hash_123"
    ]
    ports {
        internal = 3000
        external = 8080
    }
}