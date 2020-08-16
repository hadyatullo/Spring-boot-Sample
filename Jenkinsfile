#!/usr/bin/env groovy

pipeline {
    stage('docker-compose build') {
        steps {
            sh 'docker-compose build'
        }
    }

    stage('docker-compose up') {
        steps {
            sh 'docker-compose up -d'
        }
    }
}