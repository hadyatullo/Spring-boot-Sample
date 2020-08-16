#!/usr/bin/env groovy

pipeline {
    stage('docker build') {
        steps {
            sh 'docker build -t abadtj/demo .'
        }
    }

    stage('docker up') {
        steps {
            sh 'docker run -p 8080:8080 abadtj/demo'
        }
    }
}