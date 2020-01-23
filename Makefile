greet:
	echo "hello, hello-cloudapp"

list-stacks:
	aws cloudformation list-stacks

deploy-pipeline:
	aws cloudformation deploy --template-file pipeline.yml --stack-name hello-cloudapp-pipeline --capabilities CAPABILITY_NAMED_IAM

delete-pipeline:
	aws cloudformation delete-stack --stack-name hello-cloudapp-pipeline

test: mix-test

default-test:
	docker-compose run hello-cloudapp_tests echo "ok"
	docker-compose down

mix-test:
	docker-compose run hello-cloudapp_tests mix do deps.get, deps.compile, compile
	docker-compose run hello-cloudapp_tests mix ecto.create
	docker-compose run hello-cloudapp_tests mix ecto.migrate
	docker-compose run hello-cloudapp_tests mix test
	docker-compose down
