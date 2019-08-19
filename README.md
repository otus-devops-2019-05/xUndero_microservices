# xUndero_microservices [![Build Status](https://travis-ci.com/otus-devops-2019-05/xUndero_microservices.svg?branch=master)](https://travis-ci.com/otus-devops-2019-05/xUndero_microservices)
## ДЗ №14 docker-4
1. #### Работа с сетями в Docker

2. #### docker-compose:
  * Установка docker-compose;
  * Изучение возможностей docker-compose:  
Переменные окружения подставлены в файл *`.env`*,
там-же указано имя проекта.

3. #### Самостоятельное задание:
Создан файл *`docker-compose.override.yml`* соответствующий заданным параметрам.

## ДЗ №13 docker-3
1. #### Docker-образы, микросервисы:
  * Создание структуры каталогов - микросервисов;
  * Сборка образов;

2. #### Самостоятельное задание:
Для запуска контейнеров с другими алиасами и передаче их другим контейнерам использовались следующие команды:

    docker run -d --network=reddit --network-alias=db4post --network-alias=db4comment mongo:latest
    docker run -d --network=reddit --network-alias=4post -e POST_DATABASE_HOST=db4post xunder/post:1.0
    docker run -d --network=reddit --network-alias=4comment -e COMMENT_DATABASE_HOST=db4comment xunder/comment:1.0
    docker run -d --network=reddit -p 9292:9292 -e POST_SERVICE_HOST=4post -e COMMENT_SERVICE_HOST=4comment xunder/ui:1.0

3. #### Улучшение образов.
4. #### Самостоятельное задание:
Сервисы ui и comment были собраны с использованием Alpine, сервис post изначально использовал образ на основе Alpine,  
правда пришлось добавить строку для установки gcc: *`RUN apk --no-cache update && apk add --no-cache gcc=5.3.0-r0 libc-dev=0.7-r0`*

5. #### Создание volume для хранения данных.

## ДЗ №12 docker-2
1. #### Введение в Docker:
  * Установка Docker;
  * Создание - удаление контейнеров;
  * Выполнение команд в контейнере.

2. #### Docker-machine:
  * Тестирование Docker на удалённой машине;
  * Создание Dockerfile и сборка образа;

3. #### DockerHub:
  * Копирование созданного образа в удалённый реестр;
  * Проверка на локальной машине запуска контейнера из своего образа DockerHub;

4. #### Самостоятельное задание:
В каталоге Infra созданы каталоги packer, terraform, ansible.  
  * packer создаёт образ с установленным Docker;
  * terraform создаёт указанное количество экземпляров;
  * ansible скачивает и запускает контейнер образа из репозитория.
