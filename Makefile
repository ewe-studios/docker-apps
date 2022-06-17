DIR?=$(shell pwd)

build:
	cd ${DIR}/novnc && make build && cd -
	cd ${DIR}/intellij && make build && cd -

deploy:
	cd ${DIR}/novnc && make deploy && cd -
	cd ${DIR}/intellij && make deploy && cd -
