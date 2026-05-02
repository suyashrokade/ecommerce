pipeline {
    agent any

    environment {
        MVN_HOME = tool name: 'Maven'
        TOMCAT_URL = "http://localhost:8080/manager/text"
        TOMCAT_APP = "/ecommerce"
        TOMCAT_CREDENTIALS = credentials('tomcat-manager')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh "${MVN_HOME}/bin/mvn clean package"
                    } else {
                        bat "\"${MVN_HOME}\\bin\\mvn.cmd\" clean package"
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def warFile = "${pwd()}/target/ecommerce.war"
                    def credentials = "${TOMCAT_CREDENTIALS_USR}:${TOMCAT_CREDENTIALS_PSW}"
                    def deployCommand = isUnix()
                        ? "curl -u \"${credentials}\" -T ${warFile} ${TOMCAT_URL}/deploy?path=${TOMCAT_APP}&update=true"
                        : "curl -u \"${credentials}\" -T ${warFile} \"${TOMCAT_URL}/deploy?path=${TOMCAT_APP}&update=true\""
                    if (isUnix()) {
                        sh deployCommand
                    } else {
                        bat deployCommand
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline finished successfully.'
        }
        failure {
            echo 'Pipeline failed. Check the logs and Tomcat credentials.'
        }
    }
}
