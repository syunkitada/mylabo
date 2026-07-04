variable "grafana_url" {
  type = string
}

variable "grafana_token" {
  type      = string
  sensitive = true
}

variable "victoriametrics_url" {
  type = string
}

variable "loki_url" {
  type = string
}
