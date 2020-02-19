ENVLOC=/etc/trhenv
IMG=vosdb:devel
JOPTS=-Xms512m -Xmx8092m
NAME=pgdb
NET=vos_net
VOL=vos_pgdata
PORT=5432
PROG=VosDB

.PHONY: help docker exec runt stop watch

help:
	@echo "Make what? Try: docker, exec, reset, runt, stop, watch"
	@echo '  where:'
	@echo '     help    - show this help message'
	@echo '     docker  - build a ${PROG} server image'
	@echo '     exec    - exec into the running standalone ${PROG} server'
	@echo '     reset   - stop the running ${PROG} container, force its removal, and cleanup'
	@echo '     runt    - start a standalone ${PROG} server (for testing)'
	@echo '     stop    - stop the running standalone ${PROG} server'
	@echo '     watch   - show logfile for the running standalone ${PROG} server'

docker:
	docker build -t ${IMG} .

exec:
	docker cp .bash_env ${NAME}:${ENVLOC}
	docker exec -it ${NAME} bash

reset: stop
	-docker rm -f ${NAME}
	-docker network rm ${NET}

runt:
	docker network create --attachable ${NET}
	docker run -d --network ${NET} --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${IMG}

stop:
	-docker stop ${NAME}

watch:
	docker logs -f ${NAME}
