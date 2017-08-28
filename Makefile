rm-scrumblr-container:
	docker rmi scrumblr asia.gcr.io/${PROJECT_ID}/scrumblr:v1.4

rm-nginx-container:
	docker rmi scrumblr-nginx asia.gcr.io/${PROJECT_ID}/scrumblr-nginx:v1.1

build-redis-container:
	docker build -t scrumblr-redis ./redis
	docker tag scrumblr asia.gcr.io/${PROJECT_ID}/scrumblr-redis:v1.7
	gcloud docker -- push asia.gcr.io/${PROJECT_ID}/scrumblr-redis:v1.7

build-scrumblr-container:
	docker build -t scrumblr --no-cache ./scrumblr
	docker tag scrumblr asia.gcr.io/${PROJECT_ID}/scrumblr:v1.11
	gcloud docker -- push asia.gcr.io/${PROJECT_ID}/scrumblr:v1.11

build-nginx-container:
	docker build -t scrumblr-nginx ./nginx
	docker tag scrumblr-nginx asia.gcr.io/${PROJECT_ID}/scrumblr-nginx:v1.2
	gcloud docker -- push asia.gcr.io/${PROJECT_ID}/scrumblr-nginx:v1.2

make-deployment-conf:
	envsubst < scrumblr-dep-base.yaml > scrumblr-dep.yaml 

update-deployment: make-deployment-conf
	kubectl delete deployment scrumblr-dep
	kubectl create -f scrumblr-dep.yaml

update-service:
	kubectl delete service scrumblr-svc
	kubectl create -f scrumblr-svc.yaml

.PHONY: rm-scrumblr-container rm-nginx-container build-redis-container build-scrumblr-container build-nginx-container make-deployment-conf update-deployment update-service
