export GAR_HOSTNAME=asia-east1-docker.pkg.dev
export GCP_SERVICE_ACCOUNT_EMAIL=hi5-ai-server@high5-356312.iam.gserviceaccount.com
export GCP_SERVICE_ACCOUNT_KEY_PATH=high5-356312-01750eb98fda.json
export GCP_PROJECT_ID=high5-356312
export IMAGE_PATH=hi5-ai-image/hi5-llama-factory
export COMMIT_SHA=$(git rev-parse HEAD)

gcloud auth activate-service-account $GCP_SERVICE_ACCOUNT_EMAIL --key-file $GCP_SERVICE_ACCOUNT_KEY_PATH --project $GCP_PROJECT_ID
gcloud config set project $GCP_PROJECT_ID
gcloud auth configure-docker $GAR_HOSTNAME

docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
docker system prune --all -f
docker build -t docker-cuda-llamafactory .

docker tag docker-cuda-llamafactory $GAR_HOSTNAME/$GCP_PROJECT_ID/$IMAGE_PATH:$COMMIT_SHA
docker tag docker-cuda-llamafactory $GAR_HOSTNAME/$GCP_PROJECT_ID/$IMAGE_PATH:latest
docker push $GAR_HOSTNAME/$GCP_PROJECT_ID/$IMAGE_PATH:$COMMIT_SHA
docker push $GAR_HOSTNAME/$GCP_PROJECT_ID/$IMAGE_PATH:latest
