#!/bin/bash 

## Setup local repo contents
mkdir quickstart-docker 
cd quickstart-docker

echo "#!/bin/bash" >> quickstart.sh 
echo "echo \"Hello, world! The time is \$(date).\"" >> quickstart.sh 

echo "FROM alpine" >> Dockerfile
echo "COPY quickstart.sh /" >> Dockerfile
echo "CMD [\"/quickstart.sh\"]" >> Dockerfile

# Define the filename for the configuration
CONFIG_FILE="cloudbuild.yaml"

# Write the configuration to the file
cat <<EOF > $CONFIG_FILE
steps:
- name: 'gcr.io/cloud-builders/docker'
  script: |
    docker build -t us-west2-docker.pkg.dev/\$PROJECT_ID/quickstart-docker-repo/quickstart-image:tag1 .
  automapSubstitutions: true
images:
- 'us-west2-docker.pkg.dev/\$PROJECT_ID/quickstart-docker-repo/quickstart-image:tag1'
EOF


# Make quickstart.sh executable: chmod +x quickstart.sh
