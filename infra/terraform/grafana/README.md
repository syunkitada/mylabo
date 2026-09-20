# terraform: grafana

## Index

| Path | Description |
| --- | --- |
| [.terraform/](.terraform/) | 関連する設定・実装をまとめています。 |
| [.terraform.lock.hcl](.terraform.lock.hcl) | このディレクトリで使用するファイルです。 |
| [dashboards/](dashboards/) | 関連する設定・実装をまとめています。 |
| [datasources.tf](datasources.tf) | このディレクトリで使用するファイルです。 |
| [outputs.tf](outputs.tf) | このディレクトリで使用するファイルです。 |
| [providers.tf](providers.tf) | このディレクトリで使用するファイルです。 |
| [terraform.tfstate](terraform.tfstate) | このディレクトリで使用するファイルです。 |
| [terraform.tfstate.backup](terraform.tfstate.backup) | このディレクトリで使用するファイルです。 |
| [terraform.tfvars](terraform.tfvars) | このディレクトリで使用するファイルです。 |
| [variables.tf](variables.tf) | このディレクトリで使用するファイルです。 |
| [versions.tf](versions.tf) | このディレクトリで使用するファイルです。 |

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
