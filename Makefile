.PHONY: all greet test default-test mix-test

all: greet

greet:
	@ echo "hello, hello-cloudapp"

yo-regen:
	yo cloudapp

dev-server:
	docker-compose -f docker-compose.yml run --service-ports hello-cloudapp_dev mix phx.server

dev-db:
	docker-compose -f docker-compose.yml run hello-cloudapp_dev mix ecto.create

test: mix-test

default-test:
	docker-compose -f docker-compose.test.yml run hello-cloudapp_tests echo "ok"
	docker-compose -f docker-compose.test.yml down

mix-test:
	docker-compose -f docker-compose.test.yml run hello-cloudapp_tests mix do deps.get, deps.compile, compile
	docker-compose -f docker-compose.test.yml run hello-cloudapp_tests mix ecto.create
	docker-compose -f docker-compose.test.yml run hello-cloudapp_tests mix ecto.migrate
	docker-compose -f docker-compose.test.yml run hello-cloudapp_tests mix test
	docker-compose -f docker-compose.test.yml down

-include Makefile.aws
