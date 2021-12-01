ENVLOC=/etc/trhenv
IMG=astrolabe/vosdb:imgmd
JOPTS=-Xms512m -Xmx8092m
NAME=imgdb
NET=vos_net
TESTVOL=vos_testdata
VOL=vos_imgmd
PORT=5432
PROG=VosDB
PGDB=$(shell docker container ls --filter name=pgdb -q)

.PHONY: help docker exec execdb mknet stop watch

help:
	@echo "Make what? Try: boot, bootst, docker, exec, execdb, reset, run, runtst, stop, watch"
	@echo '  where:'
	@echo '     help    - show this help message'
	@echo '     boot    - initialize a ${PROG} server (set POSTGRES_PASSWORD env var first)'
	@echo '     bootst  - initialize a TestDB server (set POSTGRES_PASSWORD env var first)'
	@echo '     docker  - build a ${PROG} server image'
	@echo '     exec    - exec into a named, running server (NAME=server-name)'
	@echo '     execdb  - exec into the running ${PROG} server'
	@echo '     reset   - stop the running ${PROG} container, force its removal, and cleanup'
	@echo '     run     - start a standalone ${PROG} server (for development)'
	@echo '     runtst  - start a standalone TestDB server (for testing)'
	@echo '     stop    - stop the running DB server (${PROG} or TestDB)'
	@echo '     watch   - show logfile for the running DB server (${PROG} or TestDB)'

boot: mknet
	docker run -d -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} --network ${NET} --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${IMG}

bootst: mknet
	docker run -d -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} --network ${NET} --name ${NAME} -p ${PORT}:5432 -v ${TESTVOL}:/var/lib/postgresql/data ${IMG}

docker:
	docker build -t ${IMG} .

exec:
	docker cp .bash_env ${NAME}:${ENVLOC}
	docker cp .psqlrc   ${NAME}:/root
	docker exec -it ${NAME} bash

execdb:
	echo "EXECing into PGDB container ${PGDB}"
	docker cp .bash_env ${PGDB}:${ENVLOC}
	docker cp .psqlrc   ${PGDB}:/root
	docker exec -it ${PGDB} bash

mknet:
	-docker network create -d bridge --attachable ${NET}

reset: stop
	-docker rm -f ${NAME}
	-docker network rm ${NET}

run: mknet
	docker run -d --network ${NET} --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${IMG}

runtst: mknet
	docker run -d --network ${NET} --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${IMG}

stop:
	-docker stop ${NAME}

watch:
	docker logs -f ${NAME}
