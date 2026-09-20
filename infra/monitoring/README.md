# Monitoring

## Index

| Path | Description |
| --- | --- |
| [Makefile](Makefile) | ビルド・実行タスクの定義です。 |
| [alertmanager/](alertmanager/) | 関連する設定・実装をまとめています。 |
| [docker-compose.yml](docker-compose.yml) | 設定またはリソース定義です。 |
| [grafana-loki/](grafana-loki/) | 関連する設定・実装をまとめています。 |
| [grafana_loki.md](grafana_loki.md) | ドキュメントです。 |
| [kafka.md](kafka.md) | ドキュメントです。 |
| [vector/](vector/) | 関連する設定・実装をまとめています。 |
| [vector.md](vector.md) | ドキュメントです。 |
| [victoriametrics/](victoriametrics/) | 関連する設定・実装をまとめています。 |
| [victoriametrics-vmagent/](victoriametrics-vmagent/) | 関連する設定・実装をまとめています。 |
| [victoriametrics-vmalert/](victoriametrics-vmalert/) | 関連する設定・実装をまとめています。 |

- grafana: http://dev01.pm.local.test:3000
  - user: admin, password: admin
- victoriametrics: http://dev01.pm.local.test:8428/vmui
- victoriametrics-vmagent: http://dev01.pm.local.test:8429
- victoriametrics-vmalert: http://dev01.pm.local.test:8880
- kafka-ui: http://dev01.pm.local.test:9090
- alertmanager: http://dev01.pm.local.test:9093
- rustfs: http://dev01.pm.local.test:9001

Prometheus metrics endpoints:

- victoriametrics: http://dev01.pm.local.test:8428/metrics
- victoriametrics-vmagent: http://dev01.pm.local.test:8429/metrics
- victoriametrics-vmalert: http://dev01.pm.local.test:8880/metrics
- vector-aggregator: http://dev01.pm.local.test:9599/metrics
- vector-agent: http://dev01.pm.local.test:9598/metrics
- alertmanager: http://dev01.pm.local.test:9093/metrics
- node-exporter: http://dev01.pm.local.test:9100/metrics
