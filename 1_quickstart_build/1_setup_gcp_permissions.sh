#!/bin/bash 

## Set up cloud accounts
gcloud projects add-iam-policy-binding wck-source \
    --member=serviceAccount:$(gcloud projects describe wck-source \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --role="roles/storage.objectUser"

gcloud projects add-iam-policy-binding wck-source \
    --member=serviceAccount:$(gcloud projects describe wck-source \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --role="roles/artifactregistry.writer"

gcloud iam service-accounts add-iam-policy-binding $(gcloud projects describe wck-source \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --member=serviceAccount:$(gcloud projects describe wck-source \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --role="roles/iam.serviceAccountUser" \
    --project=wck-source
