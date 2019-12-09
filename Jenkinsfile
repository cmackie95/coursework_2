pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
           }
        }
		stage('SonarQube Static Analysis') {
			environment {
				scannerHome = tool 'SonarQube'
			}
			steps {
				echo 'Testing With Static Analysis...'
				withSonarQubeEnv('sonarqube') {
					sh "${scannerHome}/bin/sonar-scanner"
				}
				timeout(time: 10, unit: 'MINUTES') {
					waitForQualityGate abortPipeline: true
				}
			}
		}
		stage('Clone Repository') {
			steps {
				echo "Checking Out Cloned Repository..."
				checkout scm
			}
		}
		stage('Build Docker image') {
			steps {
				echo "Building Docker Image..."
				script {
					app = docker.build("cmackie95/coursework_2")
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
            }
        }
    }
}