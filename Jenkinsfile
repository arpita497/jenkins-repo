properties([
    parameters([
        choiceParam(name: 'deploymentEnv', choices: ['UAT', 'STG', 'PRD'], description: 'Please Select the Deployment Env'),
    ])   
])

node () {
    
    def DEPLOYMENT_SERVER = '3.110.56.221'
    def DEPLOYMENT_USER = 'ubuntu'
    
    def ENVS = ['UAT' : ['isProductionLike' : false, 'deploymentServer' : '3.110.56.221', 'deploymentUser' : 'ubuntu'],
                'STG' : ['isProductionLike' : false, 'deploymentServer' : '', 'deploymentUser' : ''],
                'PRD' : ['isProductionLike' : true, 'deploymentServer' : '', 'deploymentUser' : '']]
    
    stage ('git checkout step') {
        git branch: 'main', credentialsId: '05447940-1535-4b50-8bb2-c1dfb09bb6d7', url: 'https://github.com/arpita497/jenkins-repo.git'
    }
    
    
    stage ('maven build step') {
        
          sh  '''
                mvn clean package
            '''
    }
    
    stage ('Upload artifact to nexus'){
        
            
               
                   
                    nexusArtifactUploader artifacts: [
                    [
                        artifactId: 'demo',
                        classifier: '',
                        file: 'target/demo-4.0.0.war',
                        type: 'war'
                    ]
                ],
                    credentialsId: 'nexus-admin',
                    groupId: 'com.domain',
                    nexusUrl: '3.109.200.151:8081',
                    nexusVersion: 'nexus3',
                    protocol: 'http',
                    repository: 'tomcat',
                    version: '4.0.0'
                    echo 'Artifact uploaded to nexus repository'
                
            
        
            
       
    }

    stage ('Docker image dynamic build'){
        sh '''
            docker image build -t apacheimage1 .
            docker image tag apacheimage1 aaarpitaaa/apacheimage1:$BUILD_ID
            docker push aaarpitaaa/apacheimage1:$BUILD_ID
            
        '''
    }
    
    stage ('eks-deployment'){
        sh  '''
            
            sed -i "s/latest/$BUILD_ID/g" Deployment.yml
            kubectl apply -f eks-service.yml
            kubectl apply -f Deployment.yml
                
        '''
    }
  
}
