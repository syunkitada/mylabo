# Tutorial1

## Index

| Path | Description |
| --- | --- |
| [.gitignore](.gitignore) | このディレクトリで使用するファイルです。 |
| [.terraform/](.terraform/) | 関連する設定・実装をまとめています。 |
| [.terraform.lock.hcl](.terraform.lock.hcl) | このディレクトリで使用するファイルです。 |
| [main.tf](main.tf) | このディレクトリで使用するファイルです。 |
| [provider.tf](provider.tf) | このディレクトリで使用するファイルです。 |
| [terraform.tfstate](terraform.tfstate) | このディレクトリで使用するファイルです。 |
| [terraform.tfstate.backup](terraform.tfstate.backup) | このディレクトリで使用するファイルです。 |
| [terraform.tfvars](terraform.tfvars) | このディレクトリで使用するファイルです。 |
| [variables.tf](variables.tf) | このディレクトリで使用するファイルです。 |
| [version.tf](version.tf) | このディレクトリで使用するファイルです。 |

## Install

https://developer.hashicorp.com/terraform/install

## ファイル情報

- ファイル名について
  - terraformは、`*.tf` というファイルをすべて読み込むため、ファイル名はなんでもよいです。
  - しかし、慣習として以下のようなファイル名がよく使われます。
    - versions.tf
      - terraformのバージョンや、providerのバージョンを指定するファイル
    - provider.tf
      - providerの設定を記述するファイル
    - main.tf
      - リソースの定義を記述するファイル
      - リソースが多い場合は、リソースごとにファイルを分けることもあります。

## Initialize Terraform

初期状態は以下でした。

```
$ tree -a
├── main.tf
├── provider.tf
└── version.tf
```

次に、以下を実行して、terraformを初期化します。

versions.tfに記述されたproviderのバージョンに応じて、必要なproviderがダウンロードされます。

```
terraform init
```

.terraform, .terraform.lock.hcl の2つのファイルが作成されます。

- .terraform
  - providerがダウンロードされるディレクトリです。
  - .terraformディレクトリは、gitなどのバージョン管理システムに含めないようにするのが一般的です。
- .terraform.lock.hcl
  - providerのバージョンを固定するためのファイルです。
  - これをgitなどのバージョン管理システムに含めることで、チームで同じproviderのバージョンを使うことができます。
  - 再び`terraform init`を実行すると、.terraform.lock.hclに記述されたproviderのバージョンが使われます。

```
$ tree -a
.
├── .gitignore
├── .terraform
│   └── providers
│       └── registry.terraform.io
│           └── grafana
│               └── grafana
│                   └── 4.40.0
│                       └── linux_amd64
│                           ├── CHANGELOG.md
│                           ├── LICENSE
│                           ├── README.md
│                           └── terraform-provider-grafana_v4.40.0
├── .terraform.lock.hcl
├── README.md
├── main.tf
├── provider.tf
└── version.tf
```

バージョニングについて

Terraformが~>を推奨する理由

```
4.7.2
 ↑ ↑ ↑
 │ │ └ Patch
 │ └── Minor
 └──── Major

意味は

Major：互換性が壊れる可能性
Minor：新機能追加（互換性維持）
Patch：バグ修正
```

version = "~> 4.7"

- OK
  - 4.7.0
  - 4.7.1
  - 4.7.8
  - 4.8.0
  - 4.9.0
- NG
  - 5.0.0

互換性を壊さない範囲では自動的に新しいバージョンを許可する

## HCL

terraformのコードは、HCL(HashiCorp Configuration Language)という言語で書かれています。

以下のコマンドを実行すると、HCLのコードを整形することができます。

```
terraform fmt
```

以下のコマンドを実行すると、HCLのコードが正しいかどうかを検証することができます。

```
terraform validate
```

## Variable

variables.tf に、以下のように記述することで、変数を定義することができます。

```
provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_token
}
```

```
variable "grafana_url" {
  type = string
}

variable "grafana_token" {
  type      = string
  sensitive = true
}
```

terraform.tfvars に、以下のように記述することで、変数を定義することができます。
```
grafana_url = "http://localhost:3000"

grafana_token = "xxx"
```


## Resource

"Grafana" 上で、"Operations" という名前のフォルダが存在することを、terraformで定義する場合は、以下のように記述します。

```
resource "grafana_folder" "operations" {
  title = "Operations"
}
```

- "grafana_folder" は、リソースの種類を表します。
- "operations" は、リソースの名前を表します。
- title = "Operations" は、"grafana_folder" リソースの title 属性に "Operations" という値を設定することを意味します。



```
$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # grafana_folder.operations will be created
  + resource "grafana_folder" "operations" {
      + id                           = (known after apply)
      + prevent_destroy_if_not_empty = false
      + title                        = "Operations"
      + uid                          = (known after apply)
      + url                          = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```


```
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # grafana_folder.operations will be created
  + resource "grafana_folder" "operations" {
      + id                           = (known after apply)
      + prevent_destroy_if_not_empty = false
      + title                        = "Operations"
      + uid                          = (known after apply)
      + url                          = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

grafana_folder.operations: Creating...
grafana_folder.operations: Creation complete after 1s [id=0:bfr1zi3a9ca9sb]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

表記の意味

- + Create
- ~ Update
- - Destroy
- -/+ Destroy and then create replacement
  - terraformは、リソースの属性が変更された場合、リソースを破棄して再作成することがあります。
