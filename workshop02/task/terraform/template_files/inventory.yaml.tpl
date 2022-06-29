all:
  vars:
    ansible_host: ${ansible_host}
    ansible_connection: ssh
    ansible_user: ${ansible_user}
  hosts:
    server-0:
      ansible_ssh_private_key_file: ${ansible_private_key}
