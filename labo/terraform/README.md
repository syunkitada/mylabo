# Terraform

- Terraformとは
  - 一言で言うと、「あるべき状態（Desired State）を書くツール」
- 用語
  - リソース（Resource）
    - あるべき状態を定義する単位
    - 例: `aws_instance`, `aws_s3_bucket`, `aws_security_group` など
  - プロバイダー（Provider）
    - リソースを管理するためのプラグイン
    - 例: AWS, GCP, Azure, MySQL, PostgreSQL など
  - Desired State
    - あるべき状態のこと
    - 例: EC2インスタンスを1台作る、S3バケットを作る、MySQLにユーザーを作るなど
  - State
    - 現在の状態のこと
    - リソースと実態の差分を管理するために、terraformはstate情報をファイルやリモートストレージに保存しています。
    - 状態を持つだけでなく、リソースと実態の紐づけを管理するために必要な情報も含まれています。
    - この紐づけ情報がないと、terraformはリソースの差分を検知できません。
    - 例: EC2インスタンスが1台作られている、S3バケットが作られている、MySQLにユーザーが作られているなど
  - Stateファイルの保存場所
    - デフォルトでは、terraformはカレントディレクトリに `terraform.tfstate` というファイルを作成して、状態を保存します。
    - しかし、チームで開発する場合は、Stateファイルをリモートストレージに保存することが推奨されます。
    - リモートストレージに保存することで、複数人で同じStateファイルを共有できるようになります。
    - 例: S3, GCS, Azure Blob Storage, Terraform Cloud など
  - Drift
    - あるべき状態と現在の状態が異なることを指します。
    - 例: terraformでEC2インスタンスを1台作るように定義していたが、実際には2台作られていた場合、Driftが発生しています。
    - Driftが発生すると、terraformは差分を検知して、修正するためのコマンドを実行することができます。
    - 例: `terraform plan`, `terraform apply` など
  - Plan
    - あるべき状態と現在の状態の差分を検知するためのコマンド
    - 例: `terraform plan`
    - 仕組み
      1. Stateを読む
      2. Provider経由で実際のGrafanaを読む
      3. Stateを最新化（Refresh）
      4. Resource(HCL) と比較
      5. Planを表示
  - Apply
    - あるべき状態にするためのコマンド
    - 例: `terraform apply`
    - 仕組み
      1. planを計算
      2. Provider経由でResourceを作成/更新/削除
      3. 成功
      4. State保存
