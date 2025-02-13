https://cloud.google.com/build/docs/automating-builds/create-manage-triggers


**Connect a Github Repository** to Cloud Build

I moved `cloud-build-samples/python-example-flask` to its own repository: [cloud-build-python-example](https://github.com/apsocarras/cloud-build-python-example) 

Go Cloud Build Triggers > Connect repository

**Create Artifact Repository**

```bash 
gcloud artifacts repositories create cloud-build-test-repo \
    --repository-format=docker \
    --location=us-east1 \
    --description="Repository for testing/tutorials with cloud build" 
```
You refer to this AR repo in the `cloudbuild.yaml` of your connected repo.

**Create a build trigger** 

This repo we have not moved over to Cloud Source Repositories. This is the command for creating a trigger with a repo hosted in GitHub. 

```bash
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
```

**Trigger Permissions**

We were using the default Cloud Build service account with these commands. You need to ensure that it has permissions to invoke this cloud run process before running the trigger

```bash
#!/bin/bash

PROJECT_ID="wck-source"
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")                                                 

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:$PROJECT_NUMBER@cloudbuild.gserviceaccount.com" \
  --role="roles/cloudbuild.builds.builder"
```

**Test the trigger**

You can open the trigger page and invoke it manually. 
You can also push a commit on main. 

See the connected repo  [cloud-build-python-example](https://github.com/apsocarras/cloud-build-python-example) for notes on setting up the cloudbuild.yaml w/ AR 
