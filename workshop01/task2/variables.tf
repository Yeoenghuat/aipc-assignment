variable "mysql_user" {
  type    = string
  default = "root"
}

variable "mysql_pass" {
  type      = string
  sensitive = true
}

variable "mysql_name" {
  type    = string
  default = "mysql"
}

variable "myapp_name" {
  type    = string
  default = "myapp"
}

variable "mynetwork_name" {
  type    = string
  default = "mynet"
}

variable "mysql_vol_name" {
  type    = string
  default = "mysql-vol"
}

variable "nwapp_image" {
  type = object({
    image_name = string
    image_tag  = string
  })

  default = {
    image_name = "stackupiss/northwind-app"
    image_tag  = "v1"
  }
}

variable "nwdb_image" {
  type = object({
    image_name = string
    image_tag  = string
  })

  default = {
    image_name = "stackupiss/northwind-db"
    image_tag  = "v1"
  }
}