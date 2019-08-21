help:
	@echo "Make what? Try: clean, build, run, exec, init, load, append, watch, reset, destroy"

clean:
	echo "Nothing to clean yet"

build:
	docker build -t vos-init .

run:
	docker run -d --name vosi -p54320:5432 -v $(PWD)/pgdata:/var/lib/postgresql/data vos-init

exec:
	docker exec -it vosi /bin/bash

init:
	echo "Nothing to init yet"

load:
	echo "Nothing to load yet"

append:
	echo "Nothing to append yet"

watch:
	docker logs -f vosi

reset:
	docker rm -f vosi
	# docker volume prune --force

destroy:
	rm -rf pgdata
	mkdir pgdata

%:
	@:
