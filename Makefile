all: ./makefiles/ui ./makefiles/post-py ./makefiles/comment ./makefiles/fluentd
# ./makefiles/prometheus ./makefiles/mongodb_exporter ./makefiles/alertmanager

./makefiles/ui: ./src/ui/Dockerfile ./src/ui/docker_build.sh
	cd ./src/ui; bash ./docker_build.sh; cd -
	docker push xunder/ui:logging
	touch ./makefiles/ui

./makefiles/post-py: ./src/post-py/Dockerfile ./src/post-py/docker_build.sh
	cd ./src/post-py; bash ./docker_build.sh; cd -
	docker push xunder/post:logging
	touch ./makefiles/post-py

./makefiles/comment: ./src/comment/Dockerfile ./src/comment/docker_build.sh
	cd ./src/comment; bash ./docker_build.sh; cd -
	docker push xunder/comment:logging
	touch ./makefiles/comment

./makefiles/fluentd: ./logging/fluentd/Dockerfile ./logging/fluentd/fluent.conf
	docker build -t xunder/fluentd ./logging/fluentd/
	docker push xunder/fluentd:latest
	touch ./makefiles/fluentd

#./makefiles/prometheus: ./monitoring/prometheus/Dockerfile ./monitoring/prometheus/prometheus.yml ./monitoring/prometheus/alerts.yml
#	cd ./monitoring/prometheus; docker build -t xunder/prometheus .; cd -
#	docker push xunder/prometheus:latest
#	touch ./makefiles/prometheus
#
#./makefiles/mongodb_exporter: ./src/mongodb_exporter/Dockerfile
#	cd ./src/mongodb_exporter; docker build -t xunder/mongodb_exporter:1.0 .; cd -
#	docker push xunder/mongodb_exporter:1.0
#	touch ./makefiles/mongodb_exporter
#
#./makefiles/alertmanager: ./monitoring/alertmanager/Dockerfile ./monitoring/alertmanager/config.yml
#	cd ./monitoring/alertmanager/; docker build -t xunder/alertmanager .; cd -
#	docker push xunder/alertmanager:latest
#	touch ./makefiles/alertmanager
