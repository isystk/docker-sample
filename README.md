Docker サンプル
====

## Description

Nginx、Apache、Mysql などのDocker環境構築サンプルです。

こだわり
・イメージファイルを小さくするためにAlpineをベースにしています。
・指定したバージョンを利用できるようにソースコードからMakeしています。

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
$ ./dc.sh -hUsage:
```
  dc.sh [command] [<options>]

Options:
  stats|st          Dockerコンテナの状態を表示します。
  nginx start       Nginxを起動します。
  nginx stop        Nginxを停止します。
  nginx restart     Nginxを再起動します。
  apache start      Apacheを起動します。
  apache stop       Apacheを停止します。
  apache restart    Apacheを再起動します。
  mysql start       MySQLを起動します。
  mysql stop        MySQLを停止します。
  mysql restart     MySQLを再起動します。
  --version, -v     バージョンを表示します。
  --help, -h        ヘルプを表示します。
```

## Install

vi ./.env
```
PROJECT_NAME=<利用するプロジェクト名>
```

## Contribution

## Licence

[MIT](https://github.com/isystk/docker-sample/LICENCE)

## Author

[isystk](https://github.com/isystk)


