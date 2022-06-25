VERSION?=latest
HOME?=$(shell $HOME)

build:
	docker build -t influx6/intellij-u:${VERSION} .
	docker tag influx6/intellij-u:${VERSION} influx6/intellij-u:latest

push:
	docker push influx6/intellij-u:${VERSION}
	docker push influx6/intellij-u:latest

run:
	docker run -it --rm -v "${HOME}/Lab/intellij:/home/novnc/.idea:rw" -p 6080:6080 influx6/intellij-u:${VERSION}

deploy: build push