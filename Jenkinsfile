pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Pull the code from Git repository
                git url: 'https://github.com/aakshatha02/CICD-ETL-Pipeline.git', branch: 'main'
            }
        }
        stage('Verify Docker Compose') {
    steps {
        sh 'docker-compose --version'
    }
}
        stage('Data Ingestion') {
            steps {
                // Trigger Logstash for data ingestion
                sh 'docker-compose exec logstash logstash -f /usr/share/logstash/pipeline/logstash.conf'
            }
        }
        stage('Code Quality Analysis') {
            steps {
                // SonarQube analysis step
                script {
                    withSonarQubeEnv('SonarQube') {
                        sh 'mvn clean verify sonar:sonar'
                    }
                }
            }
        }
        stage('Data Visualization') {
            steps {
                // This could be a placeholder to ensure Kibana setup
                echo "Data visualization available at Kibana: http://localhost:5601"
            }
        }
    }
}
