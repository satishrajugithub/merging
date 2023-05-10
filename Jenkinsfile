#!/usr/bin/env groovy
def STATUS = ['SUCCESS': 'good', 'FAILURE': 'danger', 'UNSTABLE': 'danger', 'ABORTED': 'danger']

pipeline {
    agent { label '' }
    environment {
        VER = VersionNumber([versionNumberString : '${BUILD_YEAR}.${BUILD_MONTH}.${BUILD_DAY}.ARTECH${BUILDS_ALL_TIME}', projectStartDate : '2019-8-27']);
        imageName = "artech";
        dockerRegistry = "satishrajucdocker"
    }
    stages {

        stage('SCM') {
            steps {
                script{
                    currentBuild.displayName = VER
                }
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'satishjenkinscicdpipe', url: 'https://github.com/RamanjiReddyvempalli/ECS.git']]])
            }    
        }//end SCM

        stage ('Docker Build & Push') {            
            steps {
                    sh """
                        pwd
                        ls
                        sudo docker login -u satishrajucdocker -p Devops@123456
                        sudo docker build -t $dockerRegistry/$imageName:$VER  --pull .
                        sudo docker push $dockerRegistry/$imageName:$VER
                    """         
            }
        }//end build
        
        stage ('Trigger Deploy') {
            steps {
                    sh """
                        /usr/local/bin/kubectl --kubeconfig=secrets/kubeconfig create deployment nginx --image=$dockerRegistry/$imageName:$VER
                        /usr/local/bin/kubectl --kubeconfig=secrets/kubeconfig get secrets 
                    """
            }//end steps
        }// end push 
	     
    }//end stages

}//end pipeline
