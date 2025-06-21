pipeline {
    agent any
     stages {
        stage('Code-Checkout') {
            steps {
                // Get some code from a GitHub repository
                git credentialsId: 'GIT_CREDS', url: 'https://github.com/shiv420/capstone-project-01.git'
            }
             post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    echo 'Successfully checkout completed.'
                }
            }
        }
        stage('Docker-Build'){
            steps {
                echo 'Docker build triggred '
                sh ''' docker build -f Dockerfile -t phillip420/capstone-projet:v1 .'''
            }
        }
    }
}
