pipeline {
    agent any 
    stages {
         // Build
         stage(‘Build’) {
          agent {
           label 'master'
          }
	  steps {
            deleteDir()
            checkout scm
            sh "echo 'building the project'"		
	  }
	 }
         
	 stage (‘Test’) {
          agent {
           label 'master'
          }
	  steps {
	    deleteDir()
            checkout scm
            sh "echo 'testing the project'"
	  }
	 }
    }
    post {
         success {
           sh "echo 'success'"
         }
         failure {
           sh "echo 'failure'"
         }
    }
}
