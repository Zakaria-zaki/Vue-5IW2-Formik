start:
	docker-compose up -d

setup:
	docker-compose exec vue npm install

serve:
	docker-compose exec vue npm run serve

build:
	docker-compose exec vue npm run build

lint:
	docker-compose exec vue npm run lint

stop:
	docker-compose down