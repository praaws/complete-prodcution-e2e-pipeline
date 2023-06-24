pipeline{
    agent{
        label "jenkins-agent"
    }

    tools{
        openjdk 'Java17'
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
            git branch: 'devops',CredentialsId: 'github',url: 'https://github.com/praaws/complete-prodcution-e2e-pipeline.git'
            }
       }
    }
  
}