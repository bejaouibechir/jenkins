node{
    def app
    stage ('Clone'){
        git branch: 'main', url: 'https://github.com/bejaouibechir/jenkins.git'
    }
    stage('Build image'){
        app = docker.build('beajouibechir/nginx')
    }
    stage('Run image'){
        docker.image('beajouibechir/nginx').withRun('-p 8081:80') {
            c -> 
            sh 'docker ps'
            sh 'curl localhost:8081'
        }
    }
}