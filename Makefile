ENVLOC=/etc/trhenv
IMG=vosdb:devel
JOPTS=-Xms512m -Xmx8092m
NAME=vosdb
VOL=vos_pgdata
PORT=5432

.PHONY: help docker exec run stop watch

help:
	@echo "Make what? Try: docker, exec, run, stop, watch"
	@echo '    where: help    - show this help message'
	@echo '           docker  - build a VosDB server image'
	@echo '           exec    - exec into the running standalone VosDB server'
	@echo '           run     - start a standalone VosDB server (for testing)'
	@echo '           stop    - stop the running standalone VosDB server'
	@echo '           watch   - show logfile for the running standalone VosDB server'

docker:
	docker build -t ${IMG} .

exec:
	docker cp .bash_env ${NAME}:${ENVLOC}
	docker exec -it ${NAME} bash

run:
	docker run -d --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${IMG}

stop:
	docker stop ${NAME}
	-docker rm ${NAME}

watch:
	docker logs -f ${NAME}
