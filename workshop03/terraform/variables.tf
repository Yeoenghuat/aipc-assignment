variable "DO_token" {
  type      = string
  sensitive = true
}

variable "DO_private_key" {
  type      = string
  sensitive = true
}

variable "DO_image" {
  type    = string
  default = "ubuntu-20-04-x64"
}

variable "DO_region" {
  type    = string
  default = "SGP1"
}

variable "DO_size" {
  type    = string
  default = "s-1vcpu-2gb-intel"
}

variable "ansible_user" {
  type = string
  default = "root"
}

variable "ansible_private_key" {
  type = string
}

variable "code_server_version" {
  type = string
  default = "3.3.1"
}

variable "code_server_pwd" {
  type = string
}