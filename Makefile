# You can change the default pattern with `make PATTERN="*.env.dist" build`
PATTERN ?= *.env.dist
env_files := $(shell find . -name $(PATTERN))

# HELP - This will output the help for each task
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS

## Copy .env.dist files
define copy_envs
	$(foreach file, $(env_files), if [ -f $(file) ]; then cp $(file) $(file:.env.dist=.env); fi;)
endef


up:
	@if [ ! -d "app" ]; then \
		echo "Cloning the repository..."; \
		sh -c "git clone https://github.com/nestjs/typescript-starter.git app && rm -rf app/.git"; \
	fi
	@$(call copy_envs)
	@echo "Starting Docker Compose..."
	@docker-compose up



build: ## Copy .env.dist file, build containers from custom file
	@$(call copy_envs)
	docker-compose -f docker-compose.build.yml build

up-detach:
	@if [ ! -d "app" ]; then \
		echo "Cloning the repository..."; \
		sh -c "git clone https://github.com/nestjs/typescript-starter.git app && rm -rf app/.git"; \
	fi
	@$(call copy_envs)
	@echo "Starting Docker Compose..."
	@docker-compose up--detach

stop: ## Stop and remove a running container
	docker-compose stop

down: ## Remove running images and delete .env files
	docker-compose down --rmi all
	@rm -f -- $(foreach file, $(env_files), $(file:.env.dist=.env))

restart: down up-detach

