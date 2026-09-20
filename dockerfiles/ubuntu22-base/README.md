# ubuntu22

## Index

| Path | Description |
| --- | --- |
| [Dockerfile](Dockerfile) | Dockerイメージのビルド定義です。 |
| [Makefile](Makefile) | ビルド・実行タスクの定義です。 |

systemdを動作させるためには、以下のオプションが必要です。

```
$ sudo docker run -d -it --rm --privileged --cap-add=SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup:rw --name ubuntu22 labo/ubuntu22-base
$ sudo docker exec -it ubuntu22 bash
```
