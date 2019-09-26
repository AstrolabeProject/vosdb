IMG=vosdb
JOPTS=-Xms512m -Xmx8092m
NAME=vosdb
VOL=vos_pgdata
PORT=5432

.PHONY: help docker exec run stop watch

help:
	@echo "Make what? Try: docker, exec, run, stop, watch"

docker:
	docker build -t ${IMG} .

exec:
	docker exec -it ${NAME} bash

run:
	docker run -d --name ${NAME} -p ${PORT}:5432 -v ${VOL}:/var/lib/postgresql/data ${IMG}

stop:
	docker stop ${NAME}
	-docker rm ${NAME}

watch:
	docker logs -f ${NAME}

%:
	@:
