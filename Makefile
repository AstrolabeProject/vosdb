help:
	@echo "Make what? Try: clean, docker, run, exec, watch, reset"

clean:
	echo "Nothing to clean yet"

docker:
	docker build -t vosdb .

run:
	docker run -d --name vosdb -p5432:5432 -v pgdata:/var/lib/postgresql/data vosdb

exec:
	docker exec -it vosdb /bin/bash

watch:
	docker logs -f vosdb

reset:
	docker stop vosdb
	-docker rm vosdb

%:
	@:
