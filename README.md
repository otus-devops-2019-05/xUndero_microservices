# xUndero_microservices [![Build Status](https://travis-ci.com/otus-devops-2019-05/xUndero_microservices.svg?branch=master)](https://travis-ci.com/otus-devops-2019-05/xUndero_microservices)
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
