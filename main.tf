resource "local_file" "batch_4_file" {
         filename = "${path.module}/demo.txt" 
         content = "File created by tf"
}
provider "docker" {}

resource "docker_image" "nginx" {
        name = "nginx:latest"
        keep_locally = false
}

resource "docker_container" "nginx-cont" {
       name = "my-nginx-cont"
       image = docker_image.nginx.name
       ports {
       internal = 80
       external = 80

      } 
}
