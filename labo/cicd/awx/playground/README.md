# AWX

## Index

| Path | Description |
| --- | --- |
| [.env](.env) | このディレクトリで使用するファイルです。 |
| [Makefile](Makefile) | ビルド・実行タスクの定義です。 |
| [awx-cr/](awx-cr/) | 関連する設定・実装をまとめています。 |
| [awx-operator/](awx-operator/) | 関連する設定・実装をまとめています。 |
| [docker-compose.yml](docker-compose.yml) | 設定またはリソース定義です。 |
| [scripts/](scripts/) | 関連する設定・実装をまとめています。 |

Login to http://192.168.10.121:32000/#/login

usernameは、admin

passwordは、以下のコマンドで確認する

```
$ kubectl get secret awx-demo-admin-password -o jsonpath="{.data.password}" | base64 --decode ; echo
```
