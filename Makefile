DOCKER_COMPOSE = docker compose -f ./srcs/docker-compose.yml

build:
	$(DOCKER_COMPOSE) up --build

setup:
	@make up
	@make ps
# @は出力結果だけ表示して、コマンドの途中の出力を表示しない

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

ps:
	$(DOCKER_COMPOSE) ps

pa:
	$(DOCKER_COMPOSE) ps -a

df:
	docker system df

prune:
	docker system prune -a

prune-v:
	docker volume prune

v:
	docker volume ls

nginx:
	docker exec -it nginx bash

word:
	docker exec -it wordpress bash
db :
	docker exec -it mariadb bash

exec-%:
	$(DOCKER_COMPOSE) exec -it $* bash

logs-%:
	$(DOCKER_COMPOSE) logs $*

log:
	$(DOCKER_COMPOSE) logs

.PHONY: set up down b ps nginx word db logs-% log exec-% pa df prune v
# PHONYは擬似ターゲット make cleanで、cleanというファイルがディレクトリにあったとき、それを実行するのではなく、cleanというターゲットを実行する
