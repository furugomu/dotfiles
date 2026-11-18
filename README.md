# dotfiles

[chezmoi](https://www.chezmoi.io/) で zsh、bash、Codex の設定を管理するためのリポジトリです。

このリポジトリには設定ファイルのひな形をあえて置いていません。手元の設定を `chezmoi add` しながら、chezmoi のファイル名規則と基本操作を覚えていく想定です。

## 最初に追加するファイル

リポジトリのルートで、管理したいファイルを一つずつ追加します。

```sh
chezmoi --source . add ~/.zshrc
chezmoi --source . add ~/.bashrc
chezmoi --source . add ~/.codex/config.toml
```

追加後、リポジトリには次の名前で保存されます。

| ホームにあるファイル | chezmoi の source state |
| --- | --- |
| `~/.zshrc` | `dot_zshrc` |
| `~/.bashrc` | `dot_bashrc` |
| `~/.codex/config.toml` | `dot_codex/config.toml` |

`dot_` は、ホームへ配置するときに先頭の `.` に変換されます。

## 基本の流れ

設定を追加・編集したら、差分を確認してから適用します。

```sh
# 現在のファイルを chezmoi の管理下へ追加する
chezmoi --source . add ~/.zshrc

# chezmoi が管理する側のファイルを編集する
chezmoi --source . edit ~/.zshrc

# ホームとの差分を確認する
chezmoi --source . diff

# source state をホームへ反映する
chezmoi --source . apply --verbose
```

source state 側の実際のパスを知りたいときは、次のコマンドが便利です。

```sh
chezmoi --source . source-path ~/.zshrc
```

このリポジトリは chezmoi の既定ディレクトリとは限らないため、ここで作業するときは `--source .` を付けています。

## 別のマシンで使う

このリポジトリを Git のリモートへ push した後は、別のマシンで次のように初期化できます。

```sh
chezmoi init <GitリポジトリのURL>
chezmoi diff
chezmoi apply
```

内容を確認しながら初期化と適用をまとめて行うなら、次の形も使えます。

```sh
chezmoi init --apply <GitリポジトリのURL>
```

## 注意点

- `~/.codex` ディレクトリ全体は追加せず、まずは `config.toml` だけを管理します。認証情報や履歴などが含まれる可能性があります。
- shell 設定にトークンや秘密鍵を直接書かないようにします。
- `chezmoi diff` と `git diff` を確認してから commit すると安全です。
- テンプレート化や暗号化は、通常のファイル管理に慣れてから追加できます。

`README.md` は `.chezmoiignore` で除外しているため、`chezmoi apply` を実行してもホームディレクトリには配置されません。
