pipeline {
    agent any
    environment {
        IMAGE_NAME = "phillip420/capstone-projet"
        IMAGE_TAG = "v1"
    }
     stages {
        stage('Code-Checkout') {
            steps {
                // Get some code from a GitHub repository
                git credentialsId: 'GIT_CREDS', url: 'https://github.com/shiv420/capstone-project-01.git'
            }
             post {
                success {
                    echo 'Successfully checkout completed.'
                }
            }
        }
        stage('Docker-Build'){
            steps {
                echo 'Docker build triggred '
                sh ''' docker build -f Dockerfile -t ${IMAGE_NAME}:${IMAGE_TAG} .'''
            }
        }
        stage('Docker-Login'){
            steps {
                withCredentials([usernamePassword(credentialsId: 'DOCKER-CREDS', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            } 
            post {
                success {
                    echo 'Docker login successfully.'
                }
            }   
             
        }
        stage('Docker-Push'){
            steps {
                echo 'Pushing the image on docker hub'
                sh ''' docker push ${IMAGE_NAME}:${IMAGE_TAG} '''
            } 
            post {
                success {
                    echo 'Docker image successfully push .'
                }
            }   
             
        }
        
    }

    post {
        always {
            echo 'Cleaning up Docker resources...'
         //   sh 'docker logout || true'
           // sh "docker rmi -f ${IMAGE_NAME}:${IMAGE_TAG} || true"
            //sh 'docker container prune -f'
            //sh 'docker image prune -f'
        }
    }
}
