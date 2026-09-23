# rocy9-base

## Index

| Path | Description |
| --- | --- |
| [Dockerfile](Dockerfile) | Dockerイメージのビルド定義です。 |
| [Makefile](Makefile) | ビルド・実行タスクの定義です。 |
| [tmp-ca.pem](tmp-ca.pem) | このディレクトリで使用するファイルです。 |

systemdを動作させるためには、以下のオプションが必要です。

```
$ sudo docker run -d -it --rm --privileged --cap-add=SYS_ADMIN --name rocky9 local/rocky9-base
```
