
NGX_VERSION ?= 1.23.4
NGX_IMAGE_ALPINE ?= nginx:$(NGX_VERSION)-alpine
NGX_IMAGE_DEBIAN ?= nginx:$(NGX_VERSION)-bullseye


all: docker.alpine docker.debian

docker.alpine: docker.build.alpine docker.push.alpine
docker.debian: docker.build.debian docker.push.debian

docker.build.alpine:
	docker build \
		-t uyinn28/$(NGX_IMAGE_ALPINE)-otel \
		-f Dockerfile.nginx-alpine \
		--build-arg=IMAGE=$(NGX_IMAGE_ALPINE) \
		.

docker.build.debian:
	docker build \
		-t uyinn28/$(NGX_IMAGE_DEBIAN)-otel \
		-f Dockerfile.nginx-debian \
		--build-arg=IMAGE=$(NGX_IMAGE_DEBIAN) \
		.

docker.push.alpine:
	docker push uyinn28/$(NGX_IMAGE_ALPINE)-otel

docker.push.alpine:
	docker push uyinn28/$(NGX_IMAGE_DEBIAN)-otel

