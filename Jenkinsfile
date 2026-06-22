pipeline {
    agent any

    environment {
        IMAGE_NAME   = "your-dockerhub-username/tja-app"
        IMAGE_TAG    = "${BUILD_NUMBER}"
        DOCKER_CREDS = credentials('docker-hub-creds')
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh '''
                    echo $DOCKER_CREDS_PSW | docker login -u $DOCKER_CREDS_USR --password-stdin
                    docker push ${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh '''
                    ansible-playbook -i ~/inventories/dev/hosts.ini \
                    ~/ansible/playbooks/deploy.yml \
                    --extra-vars "image_tag=${IMAGE_TAG}"
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed! Blog deployed on worker nodes.'
        }
        failure {
            echo 'Pipeline failed. Check the stage logs above.'
        }
    }
}