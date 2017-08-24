docker-scrumblr:
	docker rmi scrumblr asia.gcr.io/${PROJECT_ID}/scrumblr:v1.0
	docker build -t scrumblr --no-cache ./scrumblr
	docker tag scrumblr asia.gcr.io/${PROJECT_ID}/scrumblr:v1.0
	gcloud docker -- push asia.gcr.io/${PROJECT_ID}/scrumblr:v1.0

docker-nginx:
	docker rmi scrumblr-nginx asia.gcr.io/${PROJECT_ID}/scrumblr-nginx:v1.0
	docker build -t scrumblr-nginx ./nginx
	docker tag scrumblr-nginx asia.gcr.io/${PROJECT_ID}/scrumblr-nginx:v1.0
	gcloud docker -- push asia.gcr.io/${PROJECT_ID}/scrumblr-nginx:v1.0

update-deployment:
	kubectl delete deployment scrumblr-dep
	kubectl create -f scrumblr-dep.yaml

update-service:
	kubectl delete service scrumblr-svc
	kubectl create -f scrumblr-svc.yaml

setup-all: docker-scrumblr docker-nginx update-deployment update-service

.PHONY: docker-scrumblr docker-nginx update-deployment update-service
