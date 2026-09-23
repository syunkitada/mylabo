resource "grafana_data_source" "victoriametrics" {
  uid        = "victoriametrics"
  name       = "VictoriaMetrics"
  type       = "prometheus"
  url        = var.victoriametrics_url
  is_default = true
}

resource "grafana_data_source" "loki" {
  uid        = "loki"
  name       = "Loki"
  type       = "loki"
  url        = var.loki_url
  is_default = false
}
