# fabfile for Infra As A Code

## Index

| Path | Description |
| --- | --- |
| [__init__.py](__init__.py) | Pythonの実装またはテストです。 |
| [any.py](any.py) | Pythonの実装またはテストです。 |
| [apply.py](apply.py) | Pythonの実装またはテストです。 |
| [debug.py](debug.py) | Pythonの実装またはテストです。 |
| [delete.py](delete.py) | Pythonの実装またはテストです。 |
| [get.py](get.py) | Pythonの実装またはテストです。 |
| [spec.md](spec.md) | ドキュメントです。 |
| [test.py](test.py) | Pythonの実装またはテストです。 |

- fabric によって、yaml ファイルで定義した仕様書からローカルに実験環境を作成できます
- 方針
  - なるべくコードはシェルスクリプトに落とし込んでブラックボックス化を避ける
    - シェルスクリプトは後から確認したり単体でも実行できるようにする
- [仕様書](spec.md)

## 使い方

- プロジェクトルートで以下を実行してください

```
# ローカルの初回環境構築（初回だけ実行してください）
$ make env
```

```
# -fで仕様書(spec.yaml)を指定して実験環境を作成します
$ sudo -E .venv/bin/fab make -f infra/local/ubuntu20.yaml -t infra
$ sudo -E .venv/bin/fab make -f infra/local/ubuntu20.yaml

# 実験環境を削除します
$ sudo -E .venv/bin/fab make -f infra/local/ubuntu20.yaml -c clean
```

```
sudo -E .venv/bin/fab make -f infra/tmp/srv6_vpn.yaml -c make:infra
```

```
# オプションで特定リソースを指定したり、特定コマンドを指定することができます
# 以下は、node:vm1のコンソールログを出力します
$ sudo -E .venv/bin/fab make -f infra/local1/spec.yaml -t node:vm1 -c log
```
