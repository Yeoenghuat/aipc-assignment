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
  default = "s-1vcpu-1gb"
}

variable "ports" {
  type    = list(number)
  default = [8081, 8082, 8083]
}

variable "containers" {

  type = map(object({
    external-port = number
  }))

  default = {
    dov-bear-4 : {
      external-port : 8084
    },
    dov-bear-5 : {
      external-port : 8085
    }
  }
}