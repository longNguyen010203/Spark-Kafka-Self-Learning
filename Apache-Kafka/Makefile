build:
	docker-compose build

up-kraft:
	docker-compose -f docker-compose.kraft.yml up -d

up-zookeeper:
	docker-compose -f docker-compose.zookeeper.yml up -d

down-kraft:
	docker-compose -f docker-compose.kraft.yml down

down-zookeeper:
	docker-compose -f docker-compose.zookeeper.yml down

restart:
	make down && make up

make to_kafka:
	docker exec -it kafka bash