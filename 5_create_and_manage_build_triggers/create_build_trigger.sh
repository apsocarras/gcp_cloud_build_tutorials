#!/bin/bash

gcloud builds triggers create github \
    --region=us-east1 \
    --repo-name=cloud-build-python-example \
    --repo-owner=apsocarras \
    --branch-pattern=^main$ \
    --build-config=cloudbuild.yaml \
    --name=my-trigger-name
    # --service-account=<email_to_service_account>
    # --require-approval 
    # --include-logs-with-status

