build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

restart:
	make down && make up

to_spark_master:
	docker exec -it spark-master /bin/bash