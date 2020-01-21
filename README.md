# Install


## Basic

```bash
mkdir docker-cloudrun && cd docker-cloudrun
npm init -y
npm i express
touch index.js
touch .dockerignore
touch .gcloudignore
touch Dockerfile
```


## Config

1. Add "start" script to package.json `"start": "node index.js"`
1. Configure Dockerfile (see https://nodejs.org/de/docs/guides/nodejs-docker-webapp/)
1. Configure .gcloudignore
1. Configure .dockerignore (exactly as .gcloudignore, then add `Dockerfile`)
1. Modify index.js as needed, check this sample https://expressjs.com/en/starter/hello-world.html


## Deploy to Cloud Run 

First submit it, then deploy it. More details here: https://cloud.google.com/run/docs/

```bash
YOUR_PROJECT_NAME=some-name
gcloud auth login # first time only
gcloud config set project $YOUR_PROJECT_NAME
gcloud builds submit --tag gcr.io/$YOUR_PROJECT_NAME/docker-cloudrun
gcloud run deploy docker-cloudrun --image gcr.io/$YOUR_PROJECT_NAME/docker-cloudrun \
  --allow-unauthenticated \
  --platform managed \
  --region us-central1 \
  --set-env-vars=^::^NODE_ENV=testing
```

## Run

### Locally

npm run start => http://localhost:3000/

### Cloud

After deploy you'll see the url like this:

`Service [docker-cloudrun] revision [docker-cloudrun-00001-vek] has been deployed and is serving 100 percent of traffic at https://docker-cloudrun-eq7l3fbfgq-uc.a.run.app`

Go to https://docker-cloudrun-eq7l3fbfgq-uc.a.run.app => 'Hello World!'

