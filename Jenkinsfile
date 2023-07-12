node{ 
    stage('Clone Git Repo'){
        git credentialsId: 'git', url: 'https://github.com/BalajiiBharath/project-IBM.git'
    }
    
    stage('Maven Build'){
        def mavenHome = tool name: "maven", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }
    
    stage('SonarQube Analysis') {       
        withSonarQubeEnv(credentialsId: 'sonar1')  {
         def mavenHome = tool name: "maven", type: "maven"
         def mavenCMD = "${mavenHome}/bin/mvn"
         sh "${mavenCMD} sonar:sonar"
    }
}
   stage ("Upload Nexus Artifact"){
    nexusArtifactUploader artifacts: [[artifactId: '01-maven-web-app', classifier: '', file: 'target/01-maven-web-app.jar', type: 'jar']], credentialsId: 'nexus', groupId: 'nb', nexusUrl: '54.215.243.227:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'nb-snapshots', version: '3.0-SNAPSHOT'
   }
}
