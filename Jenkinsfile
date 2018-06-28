#!groovy

def CONTAINER_NAME="jenkins-container"
def CONTAINER_TAG="latest"
def DOCKER_HUB_USER="sbouii"

node {
  stage ('checkout code from repository'){
    checkout scm
  }
    
  stage('build docker image'){
    build_image(CONTAINER_NAME, CONTAINER_TAG)
  }

  stage('push to docker Registry'){
    withCredentials([usernamePassword(credentialsId: 'bb1d6a8d-79d7-44e4-aa01-31a5fee6a56c', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
      def user = env.USERNAME
      def password = env.PASSWORD
      push_image(user, password, CONTAINER_NAME, CONTAINER_TAG)
    }
  }

  stage('Run docker container'){
    run_container(DOCKER_HUB_USER, CONTAINER_NAME, CONTAINER_TAG)
  }
}
def build_image(containerName, tag){
   sh "docker build -t $containerName:$tag --no-cache ."
   echo "Image building is complete"

}
def push_image(dockerUser, dockerPassword, containerName, tag){
   sh "docker login -u $dockerUser -p $dockerPassword"
   sh "docker tag $containerName:$tag $dockerUser/$containerName:$tag"
   sh "docker push $dockerUser/$containerName:$tag"
   echo "Image pushing is complete"

}
def run_container(dockerHubUser, containerName, tag){
   sh "docker pull $dockerHubUser/$containerName"
   sh "docker run -d --name $containerName $dockerHubUser/$containerName:$tag"
   echo "Container started"

}

