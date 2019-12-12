pipeline {
    agent any

    stages {
        stage('Build') {
			agent { docker { image 'node:6.3' } }
            steps {
                echo 'Building..'
				sh 'npm install'
           }
        }
		stage('SonarQube Static Analysis') {
			environment {
				scannerHome = tool 'SonarQube'
			}
			steps {
				echo 'Testing With Static Analysis...'
				withSonarQubeEnv('SonarQube') {
					sh "${scannerHome}/bin/sonar-scanner"
				}
				timeout(time: 10, unit: 'MINUTES') {
					sleep(10)
					waitForQualityGate abortPipeline: true
				}
			}
		}
		stage('Build Docker image') {
			steps {
				echo "Building Docker Image..."
				script {
					app = docker.build("cmackie95/coursework2")
				}
			}
		}	
		stage('Push Docker Image') {
            steps {
                echo 'Pushing Image to Docker...'
				script {
					docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
						app.push("${env.BUILD_NUMBER}")
						app.push("latest")
					}
				}
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
				echo 'ssh cmackie95@13.82.68.29 kubectl set image deployments/coursework2 web=docker.io/cmackie95/coursework2:${env.BUILD_NUMBER}'
				sh 'ssh cmackie95@13.82.68.29 kubectl set image deployments/coursework2 web=docker.io/cmackie95/coursework2:${env.BUILD_NUMBER}'
            }
        }
    }
}