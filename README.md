Docker サンプル
====

## Description

Nginx、Apache、Mysql などのDocker環境構築サンプルです。

こだわり
・イメージファイルを小さくするためにAlpineをベースにしています。

### ディレクトリ構造
```
.
├── docker
│  ├── nginx （Webサーバー）
│  │   ├── conf.d (nginxの設定ファイル)
│  │   ├── html (nginxの公開ディレクトリ)
│  │   ├── conf.d (nginxの設定ファイル)
│  │   └── logs （nginxのログ）
│  ├── apache （Webサーバー）
│  │   ├── conf.d (apacheの設定ファイル)
│  │   └── logs （apacheのログ）
│  ├── mysql （DBサーバー）
│  │   ├── conf.d (mysqlの設定ファイル)
│  │   ├── data (mysqlのデータファイル)
│  │   ├── init （mysqlの初期DDL）
│  │   ├── logs （mysqlのログ）
│  │   └── script （mysql関連のスクリプト）
│  ├── php （PHP-FRM）
│  │   └── logs （phpのログ）
│  ├── phpmyadmin （DB管理ツール）
│  ├── .env
│  └── docker-compose.yml
├── public (apacheの公開ディレクトリ)
└── dc.sh （Dockerの起動用スクリプト）
```

## Demo

## VS. 

## Requirement

## Usage

### DockerWindows(WSL)を利用している場合は以下の設定が必要です。
$ vi ~/.bashrc
``` 
export DOCKER_HOST=tcp://localhost:2375
```

$ sudo vi /etc/wsl.conf
``` 
[automount]
root = /
options = "metadata"
```

### 使い方
$ dc.sh -h
```
Usage:  dc.sh [command] [<options>]

Options:
  stats|st                 Dockerコンテナの状態を表示します。
  init                     Dockerコンテナ・イメージ・生成ファイルの状態を初期化します。
  start                    すべてのDaemonを起動します。
  stop                     すべてのDaemonを停止します。
  mysql login              MySQLデータベースにログインします。
  --version, -v     バージョンを表示します。
  --help, -h        ヘルプを表示します。
```

## Install

vi .env
```
PROJECT_NAME=<利用するプロジェクト名>
```

## Contribution

## Licence

[MIT](https://github.com/isystk/docker-sample/LICENCE)

## Author

[isystk](https://github.com/isystk)


