# NFS

## Index

| Path | Description |
| --- | --- |
| [archives/](archives/) | 関連する設定・実装をまとめています。 |
| [sync.sh](sync.sh) | シェルスクリプトです。 |
| [watch.go](watch.go) | このディレクトリで使用するファイルです。 |
| [watch.sh](watch.sh) | シェルスクリプトです。 |

## セットアップ

```
$ ansible-playbook ansible/roles/nfs/playbook.yaml
```

## Trouble Shooting

### unable to write to mount point (nfs-server), getting "Permission denied"

- https://serverfault.com/questions/611007/unable-to-write-to-mount-point-nfs-server-getting-permission-denied
