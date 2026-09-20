# PostgreSQL

## Index

| Path | Description |
| --- | --- |
| [k8s-postgresql.yml](k8s-postgresql.yml) | 設定またはリソース定義です。 |
| [troubleshooting.md](troubleshooting.md) | ドキュメントです。 |

- https://www.postgresql.org/

## ログイン方法

参考: https://qiita.com/domodomodomo/items/04026157b75324e4ea27

```
$ psql -h localhost -U postgres
```

パスワードファイルを利用すると、パスワード入力を省略できる

```
$ cat ~/.pgpass
127.0.0.1:5432:*:postgres:postgrespass
```

## 使い方

https://www.tohoho-web.com/ex/postgresql.html
