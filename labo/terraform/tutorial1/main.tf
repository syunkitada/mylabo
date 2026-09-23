resource "grafana_folder" "operations" {
  title = "Operations"
}

resource "grafana_data_source" "victoriametrics" {
  name = "VictoriaMetrics"

  type = "prometheus"

  url = "http://127.0.0.1:8428/prometheus"

  is_default = true
}
