help:
	@echo "Make what? Try: docker, run, exec, watch, stop"

docker:
	docker build -t vosdb .

run:
	docker run -d --name vosdb -p5432:5432 -v pgdata:/var/lib/postgresql/data vosdb

exec:
	docker exec -it vosdb /bin/bash

watch:
	docker logs -f vosdb

stop:
	docker stop vosdb
	-docker rm vosdb

%:
	@:
