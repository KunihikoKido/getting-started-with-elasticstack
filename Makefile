.PHONY: help

help: ## Show this help message.
	@echo 'usage: make [target] ...'
	@echo
	@echo 'targets:'
	@egrep '^[a-z]+(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

#----------------------------------------------------------
# Docker manage commands
#----------------------------------------------------------
.PHONY: build stop status cli tail clean start test

.docker.build:
	@docker-compose build
	@touch .docker.build

build: ## build docler containers
build:
	@$(MAKE) .docker.build

stop: ## Stop docker containers.
	@docker-compose stop

status: ## Status docker containers.
	@docker-compose ps

cli: ## Run cli
cli: build
	@docker-compose run --rm web bash

tail: ## Tail logs for docker containers
tail: build
	@docker-compose logs -f

clean: ## Clean docker containers and clean this project
	@docker-compose down --rmi all --volumes --remove-orphans
	@find . -name \*.build | xargs rm -rf

start: ## Start docker containers.
start: build
	@docker-compose up -d
