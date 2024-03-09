resource "docker_image" "prometheus" {
  name         = "prom/prometheus:latest"
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
  name         = "grafana/grafana:latest"
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

resource "docker_image" "node_exporter" {
  name         = "quay.io/prometheus/node-exporter:latest"
  keep_locally = false
}

resource "docker_container" "node_exporter_container" {
  image = docker_image.node_exporter.image_id
  name  = "node_exporter"
  ports {
    internal = 9100
    external = 9100
  }
}
