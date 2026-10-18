# dotfiles

```sh
sh makelinks.sh
```

CLI ツールは [aqua](https://aquaproj.github.io/) で入れる。一覧とバージョンは [config/aqua/aqua.yaml](./config/aqua/aqua.yaml) にある。

```sh
go install github.com/aquaproj/aqua/v2/cmd/aqua@latest
aqua i -a -l
```

バージョンを上げるときは次を実行して aqua.yaml をコミットする。`aqua up` はカレントディレクトリから一番近い aqua.yaml だけを更新するため、グローバル設定は `-c` で指定する。

```sh
aqua -c ~/.config/aquaproj-aqua/aqua.yaml up
```

毎週月曜に [Renovate](./.github/workflows/renovate.yml) が aqua.yaml を更新する PR を作る。マージしたら pull して `aqua i -a -l` を実行する。

言語ランタイム (node など) は mise で入れる。

