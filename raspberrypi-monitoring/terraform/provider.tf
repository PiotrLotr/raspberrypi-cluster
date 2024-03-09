terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"

  registry_auth {
    address  = "https://registry.hub.docker.com/v2/"
    username = var.dockerhub_user
    password = var.dockerhub_pass
  }
}
