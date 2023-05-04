pipeline {
    agent any

    environment {
        TF_VAR_aws_access_key = credentials('your-aws-access-key-id')
        TF_VAR_aws_secret_key = credentials('your-aws-secret-access-key')
        GIT_REPO_URL = 'https://github.com/your-repo-name.git'
        DOCKER_HUB_USERNAME = 'your-docker-hub-username'
        DOCKER_IMAGE_NAME = 'your-image-name'
        DOCKER_COMPOSE_PATH = 'path/to/docker-compose'
    }

    stages {
        stage('Terraform') {
            steps {
                git url: env.GIT_REPO_URL, credentialsId: 'your-git-credentials'
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Docker Build and Deploy') {
            steps {
                git url: env.GIT_REPO_URL, credentialsId: 'your-git-credentials'
                dir(env.DOCKER_COMPOSE_PATH) {
                    sh 'docker-compose build'
                    sh 'docker tag <your-image-name>:latest <your-docker-hub-username>/<your-image-name>:latest'
                    withDockerRegistry([credentialsId: 'your-docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                        sh 'docker push <your-docker-hub-username>/<your-image-name>:latest'
                    }
                }
                sshagent(['your-ssh-key']) {
                    sh '''
                        scp -i /path/to/ssh/key /path/to/docker-compose.yml ec2-user@<your-ec2-instance-public-ip>:/path/to/docker-compose/
                        ssh -o StrictHostKeyChecking=no /path/to/ssh/key ec2-user@<your-ec2-instance-public-ip> "cd /path/to/docker-compose/ && docker-compose up -d"
                    '''
                }
            }
        }
    }
}

