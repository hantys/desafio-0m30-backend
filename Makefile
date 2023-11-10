ARG=

start-build:
	docker-compose up --build --remove-orphans

start:
	docker-compose up

stop:
	docker-compose down; docker system prune -f

log:
	docker-compose log

bash:
	docker exec -it desafio-0m30-backend bash

create:
	docker-compose exec app bundle exec rake db:setup db:migrate

migrate:
	docker-compose exec app bin/rails db:migrate

seed:
	docker-compose exec app bin/rails db:seed

console:
	docker-compose exec app rails console

openapi:
	docker-compose exec -e OPENAPI=1 -e RAILS_ENV=test app rspec spec/requests

rspec:
	docker-compose exec -e RAILS_ENV=test app rspec $(ARG)

reset:
	docker-compose exec app bundle exec rake db:drop db:setup db:create db:migrate db:seed

