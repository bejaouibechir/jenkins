pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                echo 'Start clonning'
                git branch: 'main', url: 'https://github.com/bejaouibechir/jenkins.git'
                echo 'End clonning'
            }
        }
        stage('Build') {
            steps {
                echo 'Start building'
                dir('src') {
                    sh 'javac Main.java'
                }
                echo 'End building'
            }
        }
        stage('Run') {
            steps {
                echo 'Start runing'
                dir('src') {
                    sh 'java Main'
                }
                echo 'End running'
            }
        }
    }
}
