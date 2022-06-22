VERSION?=latest
HOME?=$(shell $HOME)

build:
	docker build -t influx6/intellij-u:${VERSION} .

push:
	docker push influx6/intellij-u:${VERSION}

run:
	docker run -it --rm -v "${HOME}/Lab/intellij:/home/nobody/.idea:rw" -p 6080:6080 influx6/intellij-u:${VERSION}

deploy: build push