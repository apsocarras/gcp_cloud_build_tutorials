#!/bin/bash 

gcloud artifacts repositories create quickstart-docker-repo \
    --repository-format=docker \
    --location=us-west2 --description="Docker repository"

gcloud artifacts repositories list 

