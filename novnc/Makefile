VERSION?=latest

build:
	docker build -f Dockerfile -t influx6/novnc:${VERSION} .
	docker build -f Dockerfile.light -t influx6/novnc-light:${VERSION} .

push:
	docker push influx6/novnc:latest
	docker push influx6/novnc-light:latest

deploy: build push