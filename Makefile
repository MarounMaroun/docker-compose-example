elasticsearch = elasticsearch
web-service = web_service

run:
	docker-compose up --build

kill:
	@echo 'Killing containers...'
	@docker ps | grep $(elasticsearch) | awk '{print $$1}' | xargs docker kill
	@docker ps | grep $(web-service) | awk '{print $$1}' | xargs docker kill
