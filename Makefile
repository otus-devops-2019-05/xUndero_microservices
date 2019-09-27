all: ui post-py comment prometheus mongodb_exporter

ui: ./src/ui/Dockerfile
	cd ./src/ui; bash ./docker_build.sh; cd -
	docker push xunder/ui:latest

post-py: ./src/post-py/Dockerfile
	cd ./src/post-py; bash ./docker_build.sh; cd -
	docker push xunder/post:latest

comment: ./src/comment/Dockerfile
	cd ./src/comment; bash ./docker_build.sh; cd -
	docker push xunder/comment:latest

prometheus: ./monitoring/prometheus/Dockerfile
	cd ./monitoring/prometheus; docker build -t xunder/prometheus .; cd -
	docker push xunder/prometheus:latest

mongodb_exporter: ./src/mongodb_exporter/Dockerfile
	cd ./src/mongodb_exporter; docker build -t xunder/mongodb_exporter:1.0 .; cd -
	docker push xunder/mongodb_exporter:1.0
