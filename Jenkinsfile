pipeline {
    agent any

    stages {
        stage('Checkout code') {
            steps {
                // Get some code from a GitHub repository
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nouman-hunza/repoA.git']]])
            }
        }

        stage('Doxygen Configuration') {
            steps {
                // Create Doxyfile
                sh 'doxygen -g Doxyfile'
                // Change Input directory to src
                sh 'sed -i "s/\\(INPUT *= *\\).*/\\1 src/" Doxyfile'
                // Change recursive to true so that doxygen scan files in subdirectories
                sh 'sed -i "s/\\(RECURSIVE *= *\\).*/\\1 YES/" Doxyfile'
                // Change output format to html
                sh 'sed -i "s/\\(GENERATE_HTML *= *\\).*/\\1 YES/" Doxyfile'
            }

        }

        stage('Run Doxygen') {
            steps {
                // Run Doxygen
                sh 'doxygen Doxyfile'
            }
        }

        stage('Tar the html directory') {
            steps {
                // tar the html directory into gz file
                sh 'tar -zcvf doc.tar.gz html'
            }
        }
    }
    
    post {
      success {
          // archive the artifact
          archiveArtifacts artifacts: 'doc.tar.gz', followSymlinks: false
      }
    }
}
