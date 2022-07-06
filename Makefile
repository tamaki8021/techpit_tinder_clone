DOCKER_COMPOSE := docker compose
DOCKER_COMPOSE_EXEC := $(DOCKER_COMPOSE) exec

initial: ## 初期セットアップ
	$(DOCKER_COMPOSE) up
	$(DOCKER_COMPOSE) build --no-cache --force-rm
	$(DOCKER_COMPOSE_EXEC) web ./bin/rails db:create
	$(DOCKER_COMPOSE_EXEC) web ./bin/rails db:migrate
	$(DOCKER_COMPOSE_EXEC) web ./bin/rails db:seed

### Docker Compose ###
dup:
	$(DOCKER_COMPOSE) up -d

ddown:
	$(DOCKER_COMPOSE) down

drestart:
	$(DOCKER_COMPOSE) restart

dbuild:
	$(DOCKER_COMPOSE) build --no-cache --force-rm

### Rails ###
.PHONY: test
test:
	$(DOCKER_COMPOSE_EXEC) web bundle exec rspec spec

migrate:
	$(DOCKER_COMPOSE_EXEC) web rails db:migrate

