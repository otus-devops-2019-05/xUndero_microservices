all: ./makefiles/ui ./makefiles/post-py ./makefiles/comment ./makefiles/prometheus ./makefiles/mongodb_exporter ./makefiles/alertmanager

./makefiles/ui: ./src/ui/Dockerfile
	cd ./src/ui; bash ./docker_build.sh; cd -
	docker push xunder/ui:latest
	touch ./makefiles/ui

./makefiles/post-py: ./src/post-py/Dockerfile
	cd ./src/post-py; bash ./docker_build.sh; cd -
	docker push xunder/post:latest
	touch ./makefiles/post-py

./makefiles/comment: ./src/comment/Dockerfile
	cd ./src/comment; bash ./docker_build.sh; cd -
	docker push xunder/comment:latest
	touch ./makefiles/comment

./makefiles/prometheus: ./monitoring/prometheus/Dockerfile ./monitoring/prometheus/prometheus.yml ./monitoring/prometheus/alerts.yml
	cd ./monitoring/prometheus; docker build -t xunder/prometheus .; cd -
	docker push xunder/prometheus:latest
	touch ./makefiles/prometheus

./makefiles/mongodb_exporter: ./src/mongodb_exporter/Dockerfile
	cd ./src/mongodb_exporter; docker build -t xunder/mongodb_exporter:1.0 .; cd -
	docker push xunder/mongodb_exporter:1.0
	touch ./makefiles/mongodb_exporter

./makefiles/alertmanager: ./monitoring/alertmanager/Dockerfile ./monitoring/alertmanager/config.yml
	cd ./monitoring/alertmanager/; docker build -t xunder/alertmanager .; cd -
	docker push xunder/alertmanager:latest
	touch ./makefiles/alertmanager
