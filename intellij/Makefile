VERSION?=latest
HOME?=$(shell $HOME)

build:
	docker build -t influx6/intelij-u:${VERSION} .

push:
	docker push influx6/intelij-u:${VERSION}

run:
	docker run -it --rm -v "${HOME}/Lab/intellij:/home/nobody/.idea:rw" -p 6080:6080 influx6/intelij-u:${VERSION}

deploy: build push