# dotfiles

```sh
sh makelinks.sh
```

CLI ツールは [aqua](https://aquaproj.github.io/) で入れる。一覧とバージョンは [config/aqua/aqua.yaml](./config/aqua/aqua.yaml) にある。

```sh
go install github.com/aquaproj/aqua/v2/cmd/aqua@latest
aqua i -a -l
```

バージョンを上げるときは `aqua up` を実行して aqua.yaml をコミットする。言語ランタイム (node など) は mise で入れる。

