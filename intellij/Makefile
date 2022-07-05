VERSION?=latest
HOME?=$(shell $HOME)

buildu:
	docker build -f Dockerfile -t influx6/intellij-u:${VERSION} .
	docker tag influx6/intellij-u:${VERSION} influx6/intellij-u:latest

buildc:
	docker build -f Dockerfile.intellijc -t influx6/intellij-c:${VERSION} .
	docker tag influx6/intellij-c:${VERSION} influx6/intellij-c:latest

pushu:
	docker push influx6/intellij-u:${VERSION}
	docker push influx6/intellij-u:latest

pushc:
	docker push influx6/intellij-c:${VERSION}
	docker push influx6/intellij-c:latest

build: buildu buildu

push: pushc pushu

run:
	docker run -it --rm -v "${HOME}/Lab/intellij:/home/novnc/.idea:rw" -p 6080:6080 influx6/intellij-u:${VERSION}

deploy: buildu buildc pushu pushc