PHONY: help up upd down prune restart #ecr-login ecr-pub-login

help:
	cat Makefile

# up/down
up:
	docker compose up
upd:
	docker compose up -d
upb:
	docker compose up -d --build
down:
	docker compose down --remove-orphans
prune:
	docker system prune --volumes
restart:
	@make down
	@make up


# docker cleanup
cleanup:
	docker system prune -a --volumes -f
	docker builder prune -a -f


#ecr-login:
#	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com
#ecr-pub-login:
#	aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
