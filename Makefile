DOCKER_COMPOSE := docker compose
DOCKER_COMPOSE_EXEC := $(DOCKER_COMPOSE) exec

setup: ## 初期セットアップ
	$(DOCKER_COMPOSE) up -d
	$(DOCKER_COMPOSE) build --no-cache --force-rm
	$(DOCKER_COMPOSE_EXEC) web rails db:create
	$(DOCKER_COMPOSE_EXEC) web rails db:migrate

### Docker Compose ###
up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

restart:
	$(DOCKER_COMPOSE) restart

build:
	$(DOCKER_COMPOSE) build --no-cache --force-rm

attach:
	docker exec -it techpit_tinder_clone-web-1 /bin/bash

dlog:
	$(DOCKER_COMPOSE) logs -f web

### Rails ###
install:
	$(DOCKER_COMPOSE_EXEC) web bundle install

migrate:
	$(DOCKER_COMPOSE_EXEC) web rails db:migrate

.PHONY: test
test:
	$(DOCKER_COMPOSE_EXEC) web bundle exec rspec