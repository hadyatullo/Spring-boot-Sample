#!/usr/bin/env groovy

pipeline {
    agent {
        docker {
            image 'pdmlab/jenkins-node-docker-agent:6.11.1'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
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