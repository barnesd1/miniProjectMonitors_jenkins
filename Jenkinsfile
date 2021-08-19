pipeline {
	agent any
	stages {
		stage('Clone Repo') {
			steps {
				sh 'git clone https://github.com/barnesd1/miniProjectMonitors_jenkins.git || git pull https://github.com/barnesd1/miniProjectMonitors_jenkins.git'
			}
		}
		stage('Build Jar') {
			steps {
				sh 'mvn clean package'
			}
		}
		stage('Run Jar') {
			steps {
				java -jar target/monitors-0.0.1-SNAPSHOT.jar &
			}
		}
	}
	
}
