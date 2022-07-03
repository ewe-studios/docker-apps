DIR?=$(shell pwd)
VERSION?=0.0.3

build:
	cd ${DIR}/novnc && make build VERSION=${VERSION} && cd -
	cd ${DIR}/intelliju && make build VERSION=${VERSION} && cd -

deploy:
	cd ${DIR}/novnc && make deploy VERSION=${VERSION} && cd -
	cd ${DIR}/intelliju && make deploy VERSION=${VERSION} && cd -
