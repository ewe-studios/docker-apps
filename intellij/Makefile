VERSION?=latest

build:
	docker build -t influx6/novnc:${VERSION} .

push:
	docker push influx6/novnc:latest

deploy: build push