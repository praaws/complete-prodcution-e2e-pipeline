pipeline{
    agent{
        label "jenkins-agent"
    }

    tools{
        jdk 'Java17'
        maven 'Maven3'
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

        stage('Quality gate check'){
            steps{
                script{
                    def qg = waitForQualityGate 

                    if (qg.status != 'OK'){
                        error 'quality gate has not been passed'
                        abortPipeline()
                    }
                }
            }
        }
    }
  
}