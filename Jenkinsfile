pipeline {
    agent any
    tools {
        maven 'maven'
        jdk 'java'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
        
        stage ('Compile') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true -f pom.xml clean compile' 
            }
        }
        
        stage ('Test') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true  -f pom.xml clean test' 
            }
        }
        
        stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true  -f pom.xml install' 
            }
        }
        
        stage ('Deploy to DEV') {
            steps {
                
                sh 'docker -H :1234 stop gameoflife || true'
                sh 'docker -H :1234 rm gameoflife || true'
                sh 'docker -H :1234 run -d --name gameoflife -p 9000:8080 gameoflife-dev:latest'

            }
        }
    }
}
