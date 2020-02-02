#! /bin/bash

MYSQL_CLIENT=$(dirname $0)/mysql/scripts
PATH=$PATH:$MYSQL_CLIENT

function usage {
    cat <<EOF
$(basename ${0}) is a tool for ...

Usage:
  $(basename ${0}) [command] [<options>]

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
  php start         PHPを起動します。
  php stop          PHPを停止します。
  phpmyadmin start         phpmyadminを起動します。
  phpmyadmin stop          phpmyadminを停止します。
  schemaspy exec           schemaspyを実行します。
  schemaspy init           schemaspyを初期化します。
  jenkins start         jenkinsを起動します。
  jenkins stop          jenkinsを停止します。
  --version, -v     バージョンを表示します。
  --help, -h        ヘルプを表示します。
EOF
}

function version {
    echo "$(basename ${0}) version 0.0.1 "
}

case ${1} in
    stats|st)
        docker container stats
    ;;

    init)
        # 停止＆削除（コンテナ・イメージ・ボリューム）
        docker-compose down --rmi all --volumes
        rm -Rf ./mysql/data/*
        rm -Rf ./mysql/logs/*
        rm -Rf ./apache/logs/*
        rm -Rf ./php/logs/*
        rm -Rf ./schemaspy/html/*
        rm -Rf ./jenkins/jobs/*
        rm -Rf ./jenkins/secrets/*
    ;;

    nginx)
      case ${2} in
          start)
              docker-compose up -d nginx
          ;;
          stop)
              docker-compose stop nginx && docker-compose rm -fv nginx
          ;;
          restart)
              ${0} ${1} stop && ${0} ${1} start
          ;;
          *)
              usage
          ;;
      esac
    ;;

    apache)
      case ${2} in
          start)
              docker-compose up -d apache
          ;;
          stop)
              docker-compose stop apache && docker-compose rm -fv apache
          ;;
          restart)
              ${0} ${1} stop && ${0} ${1} start
          ;;
          *)
              usage
          ;;
      esac
    ;;

    mysql)
      case ${2} in
          start)
              docker-compose up -d mysql
          ;;
          stop)
              docker-compose stop mysql && docker-compose rm -fv mysql
          ;;
          restart)
              ${0} ${1} stop && ${0} ${1} start
          ;;
          login)
              mysql -u root -ppassword -h 127.0.0.1  
          ;;
          *)
              usage
          ;;
      esac
    ;;

    php)
      case ${2} in
          start)
              docker-compose up -d php
          ;;
          stop)
              docker-compose stop php && docker-compose rm -fv php
          ;;
          *)
              usage
          ;;
      esac
    ;;

    phpmyadmin)
      case ${2} in
          start)
              docker-compose up -d phpmyadmin
          ;;
          stop)
              docker-compose stop phpmyadmin && docker-compose rm -fv phpmyadmin
          ;;
          *)
              usage
          ;;
      esac
    ;;

    schemaspy)
      case ${2} in
          init)
              docker-compose stop schemaspy && docker-compose rm -fv schemaspy && 
              docker rmi docker-sample/schemaspy && rm -Rf ./schemaspy/html/*
          ;;
          exec)
              docker-compose up -d schemaspy
          ;;
          *)
              usage
          ;;
      esac
    ;;

    jenkins)
      case ${2} in
          start)
              docker-compose up -d jenkins
          ;;
          stop)
              docker-compose stop jenkins && docker-compose rm -fv jenkins
          ;;
          *)
              usage
          ;;
      esac
    ;;

    help|--help|-h)
        usage
    ;;

    version|--version|-v)
        version
    ;;
    
    *)
        echo "[ERROR] Invalid subcommand '${1}'"
        usage
        exit 1
    ;;
esac


