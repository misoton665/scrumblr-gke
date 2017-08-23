docker rmi scrumblr
docker rmi asia.gcr.io/${PROJECT_ID}/scrumblr:v1.0
docker build -t scrumblr --no-cache .
docker tag scrumblr asia.gcr.io/${PROJECT_ID}/scrumblr:v1.0
gcloud docker -- push asia.gcr.io/${PROJECT_ID}/scrumblr:v1.0
