EN_IMAGE = yuuki/ubuntu-texlive-en
JA_IMAGE = yuuki/ubuntu-texlive-ja

all: build push

.PHONY: build
build: build/en build/ja

.PHONY: build/en
build/en:
	docker build -t $(EN_IMAGE) -f en.Dockerfile .

.PHONY: build/ja
build/ja:
	docker build -t $(JA_IMAGE) -f ja.Dockerfile .

.PHONY: push
push: push/en push/ja

.PHONY: push/en
push/en:
	docker push $(EN_IMAGE)

.PHONY: push/ja
push/ja:
	docker push $(JA_IMAGE)
