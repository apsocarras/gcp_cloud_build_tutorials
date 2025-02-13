https://cloud.google.com/build/docs/automating-builds/create-manage-triggers


**Connect a Repository** to Cloud Build
I moved `cloud-build-samples/python-example-flask` to its own repository [here](https://github.com/apsocarras/cloud-build-python-example) 

**Create a build trigger** 
This repo we have not moved over to Cloud Source Repositories. This is the command for creating a trigger with a repo hosted in GitHub. 

```bash
gcloud builds triggers create github \
    --region=us-east1 \
    --repo-name=cloud-build-samples \
    --repo-owner=apsocarras \
    --branch-pattern=^main$ \
    --build-config=python-example-flask/cloudbuild.yaml \
    --name=my-trigger-name
    # --service-account=<email_to_service_account>
    # --require-approval 
    # --include-logs-with-status
```

**Test the trigger**
You can open the trigger page and invoke it manually. 
You can also push a commit on main. 
