# terraform: grafana

## Grafana のセットアップ

Home > Administration > Users and access > Service accounts

"Add service account" をクリックして、サービスアカウントを作成する。
- Display name: terraform
- Role: Admin

"Add service account token" をクリックして、サービスアカウントのトークンを作成する。

## terraform.tfvars を作成るる

terraform.tfvars

```
grafana_url = "http://localhost:3000"
grafana_token = "<grafana_service_account_token>"

victoriametrics_url = "http://127.0.0.1:8428/prometheus"
loki_url = "http://127.0.0.1:3100"
```

## terraformを実行する

```
terraform init
```

```
terraform fmt
terraform validate
```

```
terraform plan
terraform apply
```
