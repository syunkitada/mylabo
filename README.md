# My Labo

インフラ構築の検証に使うPythonツール、Ansible定義、マニフェスト、実験用スクリプトをまとめたリポジトリです。

## Index

| Path | Description |
| --- | --- |
| [.vscode/](.vscode/) | VS Codeのプロジェクト設定です。 |
| [ansible/](ansible/) | Ansible実行環境用のDockerイメージとコレクションです。詳細は[`ansible/README.md`](ansible/README.md)を参照してください。 |
| [dockerfiles/](dockerfiles/) | Ansible、開発ツール、各種OS用のDockerイメージ定義です。詳細は[`dockerfiles/README.md`](dockerfiles/README.md)を参照してください。 |
| [etc/](etc/) | Ansibleなどで使うホスト固有の設定です。詳細は[`etc/README.md`](etc/README.md)を参照してください。 |
| [infra/](infra/) | DNS、L7ロードバランサー、TLS、監視などのインフラ構築定義です。詳細は[`infra/README.md`](infra/README.md)を参照してください。 |
| [labo/](labo/) | 個別サービスやネットワークなどの実験用スクリプト・メモです。詳細は[`labo/README.md`](labo/README.md)を参照してください。 |
| [manifests/](manifests/) | `mylabo`が処理するインフラ、VM、DNSなどのYAMLマニフェストです。詳細は[`manifests/README.md`](manifests/README.md)を参照してください。 |
| [src/](src/) | `mylabo` Pythonパッケージのソースコードです。詳細は[`src/README.md`](src/README.md)を参照してください。 |
| [tests/](tests/) | Pythonのテストコードです。詳細は[`tests/README.md`](tests/README.md)を参照してください。 |
| [AGENTS.md](AGENTS.md) | リポジトリのドキュメント整備ルールです。 |
| [.gitignore](.gitignore) | Gitで管理しない生成物・ローカルファイルを定義します。 |
| [.python-version](.python-version) | プロジェクトで使用するPythonバージョンを指定します。 |
| [Makefile](Makefile) | インフラ構築、テスト、Lint、フォーマットなどのコマンドを定義します。 |
| [ansible.cfg](ansible.cfg) | リポジトリ内のAnsibleコレクションを参照する設定です。 |
| [pyproject.toml](pyproject.toml) | Pythonパッケージ、依存関係、CLIエントリーポイントを定義します。 |
| [uv.lock](uv.lock) | Python依存関係のロックファイルです。 |
| [README.md](README.md) | リポジトリ全体の入口と構成一覧です。 |

## Setup

### 1. uvをインストールする

インストール方法は[uvの公式ドキュメント](https://docs.astral.sh/uv/getting-started/installation/)を参照してください。

### 2. 依存関係をセットアップする

```console
git clone https://github.com/syunkitada/mylabo.git
cd mylabo
uv sync --group dev
```

インフラ構築を行う場合は、`etc/ansible/host_vars/localhost.yml`の`local_ipaddr`を実行環境に合わせて設定してください。

```yaml
local_ipaddr: "192.168.XX.YY"
```

### 3. インフラを構築する

```console
make
```

`make`はDNS、TLS、L7ロードバランサーなどの環境を順に構築します。対象環境や実行権限を確認してから実行してください。

## Usage

利用可能なタスクは次のコマンドで確認できます。

```console
uv run mylabo -l
```

主な操作は`apply`、`debug`、`delete`、`get`、`test`です。たとえば、VXLANのマニフェストを適用するには次のように実行します。

```console
uv run mylabo apply -f manifests/infras/ovs/vxlan/vxlan5.1.yml
```

ホストやネットワークを変更する操作で権限が必要な場合は、実行環境のポリシーに従って`sudo`などを付けてください。

## Development

```console
# テスト
make test

# Lint
make lint

# フォーマット
make format
```
