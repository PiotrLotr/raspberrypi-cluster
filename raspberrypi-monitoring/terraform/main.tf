resource "docker_image" "prometheus" {
  name         = "prometheus:latest"
  keep_locally = false
}

resource "docker_container" "prometheus_container" {
  image = docker_image.prometheus.image_id
  name  = "prometheus"
  ports {
    internal = 9000
    external = 9000
  }
}

resource "docker_image" "grafana" {
  name         = "grafana:latest"
  keep_locally = false
}

resource "docker_container" "grafana_container" {
  image = docker_image.grafana.image_id
  name  = "grafana"
  ports {
    internal = 3000
    external = 3000
  }
}