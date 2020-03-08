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

ダミーのSMTPサーバー
http://localhost:8025/

テストメール送信
```
{
 sleep 0.3;
 echo 'ehlo';
 sleep 0.3;
 echo 'MAIL FROM:<from@example.com>';
 sleep 0.3;
 echo 'RCPT TO: <rcpt@example.com>';
 sleep 0.3;
 echo 'DATA';
 sleep 0.3;
 echo -e 'Subject: test\n\n'
 echo -e 'To:yousan@example.com\n\n'
 echo -e 'From:fromheader@example.com\n\n'
 echo -e 'this is body\n'
 echo '.';
} | telnet localhost 25
```


## Install

$ vi docker/.env
```
PROJECT_NAME=<利用するプロジェクト名>
```

$ dc.sh start

## Contribution

## Licence

[MIT](https://github.com/isystk/docker-sample/LICENCE)

## Author

[isystk](https://github.com/isystk)


