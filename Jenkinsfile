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
    }
  
}