https://cloud.google.com/build/docs/build-push-docker-image

After running setup scripts (and `cd quickstart-docker`): 

* **Option A**: Build image wtih Dockerfile and push to artifact repo
```bash 
gcloud builds submit \
    --region=us-west2 \
    --tag us-west2-docker.pkg.dev/wck-source/quickstart-docker-repo/quickstart-image:tag1
```
* **Option B**: Build with build config file and push to artifact repo

```bash 
gcloud builds submit --region=us-west2 --config cloudbuild.yaml
```
#### Verify & Cleanup 
Follow the GUI steps in the rest of the tutorial