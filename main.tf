terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "~> 2.13.0"
    }
  }
}

provider docker {}

resource "docker_image" "nginx" {
    name = "nginx:latest"
    keep_locally = false
}

resource "docker_container" "nginx" {
    name = "test"
    image = docker_image.nginx.latest
    ports {
        internal = 80
        external = 4000
    }
}
