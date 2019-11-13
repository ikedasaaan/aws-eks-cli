.PHONY: build run exec

build:
	docker build --no-cache -t k8s-cli .

run:
	docker run -it \
		--env-file .env  \
		-v $(CURDIR)/.cache/.kube:/root/.kube \
		-v $(CURDIR)/.cache/.helm:/root/.helm \
		-v $(CURDIR)/share:/root/share \
		k8s-cli /bin/zsh
		