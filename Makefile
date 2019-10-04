.PHONY: build run

build:
	docker build --no-cache -t aws-eks-cli .

run:
	docker run -it \
		-e AWS_ACCESS_KEY_ID=<YOUR AWS_ACCESS_KEY_ID> \
		-e AWS_SECRET_ACCESS_KEY=<YOUR AWS_SECRET_ACCESS_KEY> \
		-e AWS_DEFAULT_REGION=<YOUR AWS_DEFAULT_REGION> \
		-v $(CURDIR)/share:/root/share \
		aws-eks-cli /bin/bash