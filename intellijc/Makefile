VERSION?=latest
HOME?=$(shell $HOME)

build:
	docker build -t influx6/intellij-c:${VERSION} .
	docker tag influx6/intellij-c:${VERSION} influx6/intellij-c:latest

push:
	docker push influx6/intellij-c:${VERSION}
	docker push influx6/intellij-c:latest

run:
	docker run -it --rm -v "${HOME}/Lab/intellij:/home/novnc/.idea:rw" -p 6080:6080 influx6/intellij-u:${VERSION}

deploy: build push