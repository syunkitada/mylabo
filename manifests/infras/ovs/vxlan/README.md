# vxlan

## Index

| Path | Description |
| --- | --- |
| [frr/](frr/) | 関連する設定・実装をまとめています。 |
| [ovs/](ovs/) | 関連する設定・実装をまとめています。 |
| [vxlan1.1.yml](vxlan1.1.yml) | 設定またはリソース定義です。 |
| [vxlan1.yml](vxlan1.yml) | 設定またはリソース定義です。 |
| [vxlan2.yml](vxlan2.yml) | 設定またはリソース定義です。 |
| [vxlan3.yml](vxlan3.yml) | 設定またはリソース定義です。 |
| [vxlan4.yml](vxlan4.yml) | 設定またはリソース定義です。 |
| [vxlan5.1.yml](vxlan5.1.yml) | 設定またはリソース定義です。 |
| [vxlan5.yml](vxlan5.yml) | 設定またはリソース定義です。 |

## デバッグ

### dump flows

```
[root@HV1 /]# ovs-ofctl dump-flows br-ex
...
[root@HV1 /]# ovs-ofctl dump-flows br-t1
...
[root@HV1 /]# ovs-ofctl dump-flows br-t1-int
 cookie=0x0, duration=481.664s, table=0, n_packets=0, n_bytes=0, priority=0 actions=NORMAL
```
