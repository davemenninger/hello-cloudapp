hello:
	echo "hello"

greet:
	echo "hello, hello-cloudapp"

list-stacks:
	aws cloudformation list-stacks

deploy-pipeline:
	aws cloudformation deploy --template-file pipeline.yml --stack-name hello-cloudapp-pipeline --capabilities CAPABILITY_NAMED_IAM

test:
	echo "ok"
