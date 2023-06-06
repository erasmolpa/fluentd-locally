FLUENTD_IMAGE_NAME = fluentd-tool
FLUENTUI_IMAGE_NAME = fluentd-tool-ui

build-fluentd:
	docker build -t $(FLUENTD_IMAGE_NAME) -f Dockerfile_fluentd .

run-fluentd:
	docker run -d -p 24224:24224 -p 24220:24220 --name $(FLUENTD_IMAGE_NAME) $(FLUENTD_IMAGE_NAME)

stop-fluentd:
	docker stop $(FLUENTD_IMAGE_NAME)
	docker rm $(FLUENTD_IMAGE_NAME)

build-fluentd-ui:
	docker build -t $(FLUENTUI_IMAGE_NAME) -f Dockerfile_fluent_ui .

run-fluentd-ui:
	docker run -d -p 9292:9292 --name $(FLUENTUI_IMAGE_NAME) $(FLUENTUI_IMAGE_NAME)

stop-fluentd-ui:
	docker stop $(FLUENTUI_IMAGE_NAME)
	docker rm $(FLUENTUI_IMAGE_NAME)
.PHONY: build run stop
