pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps {
                git url: 'https://github.com/aakshatha02/CICD-ETL-Pipeline.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("etl-pipeline")
                }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarQubeScanner'
                    withSonarQubeEnv('SonarQube') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
