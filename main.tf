terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered_image" {
    name = "nodered/node-red:latest"
}

resource "docker_container" "nodered_container" {
    name = "nodered"
    image = docker_image.nodered_image.latest
    ports {
        internal = 1880
        external = 1880
    }
}

output "IP-Adress" {
  value = join(":", [docker_conteiner.nodered_container.ip_adress, docker_container.nodered_conteiner.ports[0].external])
  description = "TheIP adress of the container"
}

uotput "container-name" {
  value = docker_container.nodered_container.name
  description = "The name of the container"
      
