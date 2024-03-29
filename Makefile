ENVLOC=/etc/trhenv
IMG=astrolabe/alwsdb:1.0
JOPTS=-Xms512m -Xmx8092m
NAME=alwsdb
NET=vos_net
VOL=vos_alwsdb
PORT=5432
PROG=ALWSDB
# PGDB=$(shell docker container ls --filter name=pgdb -q)
SHELL=/bin/bash

.PHONY: help boot docker exec execdb mknet stop watch

help:
	@echo "Make what? Try: bash, boot, docker, execdb, reset, run, stop, watch"
	@echo '  where:'
	@echo '     help    - show this help message'
	@echo '     bash    - run Bash in a ${PROG} container (for development)'
	@echo '     boot    - initialize a ${PROG} server (use Make variable POSTGRES_PASSWORD)'
	@echo '     docker  - build a ${PROG} server image'
	@echo '     execdb  - exec into the named (running) server (default: ${NAME})'
	@echo '     reset   - stop the running ${PROG} container, force its removal, and cleanup'
	@echo '     run     - start a standalone ${PROG} server (for development)'
	@echo '     stop    - stop the running DB server (${PROG} or TestDB)'
	@echo '     watch   - show logfile for the running DB server (${PROG} or TestDB)'

bash: run execdb

boot: mknet
	docker run -d -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} --network ${NET} --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${IMG}

docker:
	docker build -t ${IMG} .

execdb:
	docker cp .bash_env ${NAME}:${ENVLOC}
	docker cp .psqlrc   ${NAME}:/root
	docker exec -it ${NAME} bash

mknet:
	-docker network create -d bridge --attachable ${NET}

reset: stop
	-docker rm -f ${NAME}
	-docker network rm ${NET}

run: mknet
	docker run -d --network ${NET} --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${IMG}

stop:
	-docker stop ${NAME}

watch:
	docker logs -f ${NAME}
