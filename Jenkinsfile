#!/usr/bin/env groovy

pipeline {
    stages {
        stage('docker-compose build') {
            steps {
                sh 'COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose build'
            }
        }

        stage('docker-compose up') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}