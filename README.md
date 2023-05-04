# cyware

Jenkins Pipeline for Terraform and Docker Deployments
This Jenkins pipeline deploys a web application on an EC2 instance in AWS using Terraform to create the infrastructure and Docker Compose to build and deploy the application.

#Prerequisites
Before you can run this pipeline, you need to have the following:

An AWS account with credentials that have permissions to create VPCs, subnets, EC2 instances, security groups, and an application load balancer.
An SSH keypair that can be used to connect to the EC2 instance created by Terraform.
A Docker Hub account and credentials that can be used to push the Docker image to Docker Hub.
A Git repository containing the following files:
A Terraform configuration file (terraform/main.tf) that defines the AWS infrastructure.
A Docker Compose file (docker-compose.yml) that defines the Docker containers and services.

#Usage
To use this pipeline, follow these steps:

Set up the Jenkins server.
Install the following Jenkins plugins:
Git plugin
SSH Agent plugin
Docker plugin
Docker Pipeline plugin
Pipeline Utility Steps plugin
Create the following Jenkins credentials:
AWS access key ID and secret access key for the AWS account.
Git credentials for the Git repository.
Docker Hub credentials for the Docker Hub account.
SSH key for the EC2 instance.
Create a new Jenkins pipeline.
Copy the pipeline script (Jenkinsfile) into the pipeline.
Configure the following environment variables in the pipeline:
TF_VAR_aws_access_key: AWS access key ID.
TF_VAR_aws_secret_key: AWS secret access key.
GIT_REPO_URL: URL of the Git repository.
DOCKER_HUB_USERNAME: Docker Hub username.
DOCKER_IMAGE_NAME: Name of the Docker image.
DOCKER_COMPOSE_PATH: Path to the Docker Compose file in the Git repository.
Run the pipeline.
The pipeline will perform the following steps:

Terraform will create the AWS infrastructure (VPC, subnets, EC2 instance, security groups, and application load balancer).
Docker Compose will build the Docker image, tag it with the Docker Hub username and image name, and push it to Docker Hub.
The Docker Compose file will be copied to the EC2 instance using scp.
The Docker Compose file will be run on the EC2 instance using docker-compose up -d.
The web application will now be accessible at the public IP address of the EC2 instance.
