pipeline{
    agent{
        label "jenkins-agent"
    }

    tools{
        jdk 'Java17'
        maven 'Maven3'
    }

    environment{
        REPO_NAME = "complete-production-e2e-pipeline"
        RELEASE = "1.0.0"
        IMAGE_NAME = "704437922618.dkr.ecr.us-east-2.amazonaws.com/${REPO_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
    }

    stages{
        stage('clean the Jenkins Workspace'){
            steps{
                cleanWs()
            }
        }

        stage('checkout SCM'){
            steps{
            git branch: 'devops',credentialsId: 'github',url: 'https://github.com/praaws/complete-prodcution-e2e-pipeline.git'
            }
       }

        stage('Build the artifact'){
            steps{
                sh 'mvn clean package'
            }
        }

        stage('Tests'){
            steps{
                sh 'mvn test'
            }
        }

        stage('static code analysis'){
            steps{
                script{
                withSonarQubeEnv(credentialsId: 'sonarqube-jenkins-token'){
                    sh 'mvn sonar:sonar'
                    }
                }
            }
        }

        stage('Docker image build and scan'){
            steps{
                script{
                    def docker_image = docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Docker push'){
            steps{
                script{
                    def docker_image = docker.image("${IMAGE_NAME}")

                        docker.withRegistry('704437922618.dkr.ecr.us-east-2.amazonaws.com','Jenkins-ECR'){
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push("latest")
                    }
                }
            }
        }
    }
  
}