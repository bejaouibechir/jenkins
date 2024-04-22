pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE_NAME = 'bechirbejaoui/nginx-custom'
        DOCKER_FILE_PATH = './Dockerfile'
        NGINX_INDEX_PAGE = './index.html'
        DOCKERHUB_USERNAME = credentials('docker-username')
        DOCKERHUB_PASSWORD = credentials('docker-password')
    }
    
    stages {
        stage('Build Image') {
            steps {
                echo 'Building NGINX custom image'
                script {
                    docker.build(DOCKER_IMAGE_NAME, '-f ${DOCKER_FILE_PATH} .')
                }
            }
        }
        
        stage('Test Image') {
            steps {
                echo 'Testing NGINX custom image locally'
                script {
                    docker.image(DOCKER_IMAGE_NAME).run('-d -p 8088:80')
                    sh 'sleep 10' // Wait for NGINX to start
                    sh 'curl localhost:8080' // Test NGINX response
                    docker.image(DOCKER_IMAGE_NAME).stop()
                }
            }
        }
        
        stage('Tag and Push Image') {
            steps {
                echo 'Tagging NGINX custom image'
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_USERNAME, DOCKERHUB_PASSWORD) {
                        docker.image(DOCKER_IMAGE_NAME).push("latest")
                    }
                }
            }
        }
    }
}
