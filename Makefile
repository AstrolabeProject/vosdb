help:
	@echo "Make what? Try: clean, build, run, exec, init, load, append, watch, reset, destroy"

clean:
	echo "Nothing to clean yet"

build:
	docker build -t vosdb .

run:
	docker run -d --name vosdb -p5432:5432 -v $(PWD)/pgdata:/var/lib/postgresql/data vosdb

exec:
	docker exec -it vosdb /bin/bash

init:
	echo "Nothing to init yet"

load:
	echo "Nothing to load yet"

append:
	echo "Nothing to append yet"

watch:
	docker logs -f vosdb

reset:
	docker rm -f vosdb
	# docker volume prune --force

destroy:
	rm -rf pgdata
	mkdir pgdata

%:
	@:
