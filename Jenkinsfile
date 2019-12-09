pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
           }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
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
				app = docker.build("cmackie95/coursework_2")
			}
		}	
		stage('Push Docker Image') {
            steps {
                echo 'Pushing Image to Docker...'
				docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
					app.push("${env.BUILD_NUMBER}")
					app.push("latest")
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