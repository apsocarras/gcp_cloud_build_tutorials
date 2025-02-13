https://cloud.google.com/build/docs/deploy-containerized-application-cloud-run

**Deploy a container app to Cloud Run Service**

Authenticate in shell session with gcloud before `gcloud auth login` 

```bash 
source 1_setup_gcp_permissions.sh
mkdir helloworld && cd $_
```
Create `cloudbuild.yaml` with the deployment instructions: 

```yaml
steps:
- name: 'gcr.io/cloud-builders/gcloud'
  script: |
    gcloud run deploy cloudrunservice 
      --image us-docker.pkg.dev/cloudrun/container/hello 
      --region us-west1
      --platform managed 
      --allow-unauthenticated
```
* in this example, we refer a pre-built image hosted in artifact registry: 
`us-docker.pkg.dev/cloudrun/container/hello`

Deploy image with cloud build 

```bash 
gcloud builds submit \ 
    --region='us-west1' \
    --config cloudbuild.yaml
```

Run the cloud run function:

```bash
curl -H \
"Authorization: Bearer $(gcloud auth print-identity-token)" \
https://cloudrunservice-912138393635.us-west1.run.app
```
