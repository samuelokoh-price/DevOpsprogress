pipeline {
    agent any
    stages{
        stage("Checkout"){
            steps{
                echo "pulling code from github"
                git branch: 'main', url: 'https://github.com/samuelokoh-price/End-to-End-Devops-pipeline-project.git'
            }
            post{
                always{
                    echo "checkout"
                }
                success{
                    echo "======== executed successfully========"
                }
                failure{
                    echo "======== execution failed ========"
                }
            }
        }
        stage("Build"){
            steps{
                echo "building the application"
                dir('simple-nodejs-app-1'){
                    sh 'npm install'
                }
            }
            post{
                always{
                    echo "build"
                }
                success{
                    echo "======== executed successfully========"
                }
                failure{
                    echo "======== execution failed ========"
                }
            }
        }
        stage("Test"){
            steps{
                echo "testing the application"
                dir('simple-nodejs-app-1'){
                    sh 'npm test'
                }
            }
            post{
                always{
                    echo "test"
                }
                success{
                    echo "======== executed successfully========"
                }
                failure{
                    echo "======== execution failed ========"
                }
            }
        }
        stage("Docker Build"){
            steps{
                echo "building docker image"
                dir('simple-nodejs-app-1'){
                    sh 'docker build -t simple-nodejs-app .'
                }
            }
            post{
                always{
                    echo "docker build"
                }
                success{
                    echo "======== executed successfully========"
                }
                failure{
                    echo "======== execution failed ========"
                }
            }
        }
        stage("Docker Push"){
            steps{
                echo "pushing docker image to docker hub"
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    sh 'docker tag simple-nodejs-app $DOCKERHUB_USERNAME/simple-nodejs-app:latest'
                    sh 'docker push $DOCKERHUB_USERNAME/simple-nodejs-app:latest'
                }
            }
            post{
                always{
                    echo "docker push"
                }
                success{
                    echo "======== executed successfully========"
                }
                failure{
                    echo "======== execution failed ========"
                }
            }
        }
        stage("Deploy"){
            steps{
                echo "deploying the application"

                sh 'docker rm -f simple-nodejs-app || true'

                sh 'docker run -d -p 3000:3000 --name simple-nodejs-app simple-nodejs-app'
            }
            post{
                always{
                    echo "deploy"
                }
                success{
                    echo "======== executed successfully========"
                }
                failure{
                    echo "======== execution failed ========"
                }
            }
        }
    }    
    post{
        always{
            echo "========Checked========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }

}
    

