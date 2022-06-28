variable "DO_token" {
  type      = string
  sensitive = true
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