#!/usr/bin/env groovy

pipeline {
    agent any
    stages {
        stage('boot build image') {
            steps {
                sh './gradlew bootBuildImage --info'
            }
        }
    }
}