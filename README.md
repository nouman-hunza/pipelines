# Table of Contents

1. Task B
   * [repoA - Forked Repository](https://github.com/nouman-hunza/repoA)
   * [Pipeline B](https://github.com/nouman-hunza/pipelines/tree/taskB)
   
2. Task C 
   * [repoC - Python Log Parser Repository](https://github.com/nouman-hunza/repoC)
   * [Pipeline C](https://github.com/nouman-hunza/pipelines/tree/taskC)
3. Task D   
   * [Answers](https://github.com/nouman-hunza/pipelines/tree/taskD)
   * **[Notes on extending pipelineB in pipelineC](https://github.com/nouman-hunza/pipelines/blob/taskC/README.md)**

# Jenkins
## Prerequisites
  * Git client
  * Docker runtime
  * JRE 8+ (To create Jenkins jobs)
## Build and Run Jenkins
  This project use Dockerfile to create jenkins image that can be used to run jenkins. The jenkins instance has all the required packages and jenkins plugins installed that are needed to run and test the project.
To perform the following steps clone the git repository in your local environment using ```git clone https://github.com/nouman-hunza/pipelines.git``` and run the commands from the root of cloned repository.
#### Build Docker image
  ```console
  docker build -t jenkins:assignment .
  ```
  This will take some time to download the plugins, you can see the list of plugins in the [plugin.txt](https://github.com/nouman-hunza/pipelines/blob/main/plugins.txt) file in this project. No external jenkins plugin is needed to run the pipelines. This list only contains minimum default plugin provided with standard jenkins installation.
  Also the following packages installed in the image.
  * doxygen
  * python3
#### Run Jenkins
  ```console
  docker run --name jenkins --rm -p 8080:8080 jenkins:assignment
  ```
#### Creating Jobs
  Once the jenkins up and running you can run following to create two jobs name pipelineB and pipelineC

  ```console
  java -jar jenkins-cli.jar -s http://localhost:8080 create-job pipelineB < pipelineB.xml
  java -jar jenkins-cli.jar -s http://localhost:8080 create-job pipelineC < pipelineC.xml
  ```
#### Building Jobs
  Open browser and go to http://localhost:8080. You would be able to see two jobs (pipelineB, pipelineC).
  Click any job and click on Build Now to build the job. Once the build is completed you can see uploaded archive at the job main page.
