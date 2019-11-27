# xUndero_microservices [![Build Status](https://travis-ci.com/otus-devops-2019-05/xUndero_microservices.svg?branch=master)](https://travis-ci.com/otus-devops-2019-05/xUndero_microservices)
## ДЗ 22 kubernetes-4
1. #### Работа с Helm;                       
2. #### Установка Gitlab в k8s;
3. #### Запуск CI/CD в k8s;

## ДЗ 21 kubernetes-3
1. #### Изучение сетевого взаимодействия k8s:
  * Service (ClusterIP, NodePort, LoadBalanser);
  * Ingress (TLS);
  * Задание со*: для создания манифеста для объекта Secret использовалась команда:  
    *`kubectl get secret ui-ingress -o yaml > ./tls-secret.yml`*

2. #### NetworkPopicy;
3. #### Подключение системы хранения;
  * Volume, PersistentVolume, PersistentVolumeClaim

## ДЗ 20 kubernetes-2
1. #### Знакомство с локальным k8s, развёртывание с помощью minikube;
  * Правда для доступа к Dashboard пришлось создать сервис NodePort и пробрость порт 9090
2. #### Создание кластера в GKE;
  * Кластер создал и запустил приложение: *`kubectl apply -f ./kubernetes/reddit/ -n dev`*
  * Приложение было доступно по адресу *`http://34.77.32.0:31047/`*
3. #### Самостоятельное задание:
  * Создал кластер с помощью terraform.(правда terraform крашится, но кластер создаётся и работает)
  * и как подсказал Василий для доступа к Dashboard используется ссылка:  
  *`http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login`*

## ДЗ 19 kubernetes-1
1. #### Знакомство с k8s, развёртывание с помощью the_hard_way;
2. #### Самостоятельное задание:
  * Некоторые этапы развёртывания описаны с помощью Ansible.

## ДЗ 18 logging-1
1. #### Подготовка стека EFK;
2. #### Структурированные и неструктурированные логи в интерфейсе Kibana;
3. #### Проверка трейсинга на основе Zipkin.

## ДЗ 17 monitoring-2
1. #### Мониторинг docker образов - cAdvisor;
2. #### Визуализация мониторинга - Grafana;
3. #### Алертинг.
  * Созданные в процессе работы образы в репозитории https://hub.docker.com/u/xunder 

## ДЗ 16 monitoring-1
1. #### Prometheus, запуск и знакомство;
2. #### Настройка и проверка сбора метрик;
  * Созданные в процессе работы образы в репозитории https://hub.docker.com/u/xunder 
3. #### Самостоятельное задание:
  * Для мониторинга MongoDB из проекта percona/mongodb_exporter собран образ xunder/mongodb_exporter:1.0
  * Для blackbox использовался образ prom/blackbox-exporter:v0.15.1
  * Создан Makefile.

## ДЗ №15 gitlab-ci-1
1. #### Инсталляция Gitlab-CI
  * Для создания сервера использовался docker-machine
  * Для подготовки и запуска Gitlab-CI - ansible
2. #### Подготовка репозитория
3. #### Описание этапов пайплайна
4. #### Определение окружений
5. #### Самостоятельное задание:
  * Использовался файл *`.gitlab-ci.yml.new`*
  * На шаге build происходит сборка образа и заливка в dockerhub
  * На шаге deploy происходит запуск контейнера c приложением
  * настроена интеграция со slack - https://app.slack.com/client/T6HR0TUP3/CKLK2L4HK

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
