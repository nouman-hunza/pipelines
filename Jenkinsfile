pipeline {
    agent any
    
    environment {
      WARN_FILE = "doxygen_warn.log"
      DELIMITER = "<<>>"
      OUTPUT_FILE = "parser_output.csv"
    }

    stages {
        stage('Clone Repo A') {
            steps {
              git 'https://github.com/nouman-hunza/repoA.git'
            }
        }
        
        stage('Clone Repo C') {
            steps {
                dir('parser') {    
                  git branch: 'main', url: 'https://github.com/nouman-hunza/repoC.git'
                }
            }
        }
        
        stage('Doxygen Configuration') {
            steps {
                echo "${WORKSPACE}"
                // Create Doxyfile
                sh 'doxygen -g Doxyfile'
                // Change Input directory to src
                sh 'sed -i "s/\\(INPUT *= *\\).*/\\1 src/" Doxyfile'
                // Change recursive to true so that doxygen scan files in subdirectories
                sh 'sed -i "s/\\(RECURSIVE *= *\\).*/\\1 YES/" Doxyfile'
                // Change output format to html
                sh 'sed -i "s/\\(GENERATE_HTML *= *\\).*/\\1 YES/" Doxyfile'
                // Route the warning stdout to file
                sh 'sed -i "s/\\(WARN_LOGFILE *= *\\).*/\\1 $WARN_FILE/" Doxyfile'
                // Set the warn format 
                sh 'sed -i "s/\\(WARN_FORMAT *= *\\).*/\\1 \$""line$DELIMITER\$""file$DELIMITER\$""text/" Doxyfile'
            }

        }

        stage('Run Doxygen') {
            steps {
                // Run Doxygen
                sh 'doxygen Doxyfile'
            }
        }
        
        stage('Run Parser') {
            steps {
                dir('parser') {
                   sh 'python3 doxygen_parser.py -i ../$WARN_FILE -o $OUTPUT_FILE -d $DELIMITER -r ${WORKSPACE}/'
                }
             }
        }
    }
    
    post {
      success {
          dir('parser') {
              // archive the artifact
              archiveArtifacts artifacts: 'parser_output.csv', followSymlinks: false
           }  
       }
    }
}
