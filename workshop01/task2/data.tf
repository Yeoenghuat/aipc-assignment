# data "docker_image" "myapp-image" {
#   name = "${var.nwapp_image.image_name}:${var.nwapp_image.image_tag}"
# }

# data "docker_image" "mysql-image" {
#   name = "${var.nwdb_image.image_name}:${var.nwdb_image.image_tag}"
# }