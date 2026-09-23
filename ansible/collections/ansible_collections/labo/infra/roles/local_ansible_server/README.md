# local_ansible_server

Ansibleの非root実行環境でroot権限のコマンドを実行するための設定です。

```console
/opt/ansible-nonroot/bin/oslo-rootwrap /etc/ansible/rootwrap.conf sleep 2
```

## Index

| Path | Description |
| --- | --- |
| [files/](files/) | 関連する設定・実装をまとめています。 |
| [tasks/](tasks/) | 関連する設定・実装をまとめています。 |
| [templates/](templates/) | 関連する設定・実装をまとめています。 |
