DIR?=$(shell pwd)
VERSION?=0.0.4

build:
	cd ${DIR}/novnc && make build VERSION=${VERSION} && cd -
	cd ${DIR}/intelliju && make build VERSION=${VERSION} && cd -
	cd ${DIR}/intellijc && make build VERSION=${VERSION} && cd -

push:
	cd ${DIR}/novnc && make push VERSION=${VERSION} && cd -
	cd ${DIR}/intelliju && make push VERSION=${VERSION} && cd -
	cd ${DIR}/intellijc && make push VERSION=${VERSION} && cd -

deploy:
	cd ${DIR}/novnc && make deploy VERSION=${VERSION} && cd -
	cd ${DIR}/intelliju && make deploy VERSION=${VERSION} && cd -
	cd ${DIR}/intellijc && make deploy VERSION=${VERSION} && cd -
