ENVLOC=/etc/trhenv
BOOTIMG=astrolabe/vosdb:4.1
IMG=vosdb:devel
JOPTS=-Xms512m -Xmx8092m
NAME=pgdb
NET=vos_net
VOL=vos_pgdata
PORT=5432
PROG=VosDB
PGDB=$(shell docker container ls --filter name=pgdb -q)

.PHONY: help boot docker exec run stop watch

help:
	@echo "Make what? Try: boot, docker, exec, reset, run, stop, watch"
	@echo '  where:'
	@echo '     help    - show this help message'
	@echo '     boot    - initialize the ${PROG} database (set POSTGRES_PASSWORD env var first)'
	@echo '     docker  - build a ${PROG} server image'
	@echo '     exec    - exec into the running standalone ${PROG} server'
	@echo '     reset   - stop the running ${PROG} container, force its removal, and cleanup'
	@echo '     run     - start a standalone ${PROG} server (for testing)'
	@echo '     stop    - stop the running standalone ${PROG} server'
	@echo '     watch   - show logfile for the running standalone ${PROG} server'

boot:
	-docker network create -d overlay --attachable ${NET}
	docker run -d -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} --network ${NET} --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${BOOTIMG}

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

reset: stop
	-docker rm -f ${NAME}
	# -docker network rm ${NET}

run:
	docker run -d --network ${NET} --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${IMG}

stop:
	-docker stop ${NAME}

watch:
	docker logs -f ${NAME}
