IMAGE_NAME = fluentd-tool

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d -p 24224:24224 -p 24220:24220 -p 9292:9292 --name $(IMAGE_NAME) $(IMAGE_NAME)

stop:
	docker stop $(IMAGE_NAME)
	docker rm $(IMAGE_NAME)

build-nerdctl:
	nerdctl build -t $(IMAGE_NAME) .

run-nerdctl:
	nerdctl run -d -p 24224:24224 -p 24220:24220 -p 9292:9292 --name $(IMAGE_NAME) $(IMAGE_NAME)

stop-nerdctl:
	nerdctl stop $(IMAGE_NAME)
	nerdctl rm $(IMAGE_NAME)
.PHONY: build run stop
