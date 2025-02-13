https://cloud.google.com/build/docs/automate-builds

Fork and clone this repo: https://github.com/GoogleCloudPlatform/cloud-build-samples

* Do this in another directory to avoid nesting git histories

Connect Cloud Build to your Repo (follow GUI instructions to create a trigger) 
* GUI prompts in github install the Google Cloud Build App
* Can limit to this repo
* Select repository from drop down back in GCP

Create a trigger

Commit a change
* This will result in an automatic build 


View build history 
* Cloud build > history > select build > build details > download build log 
* Saved log here: `build_log.txt`

Cleanup: remove the trigger 