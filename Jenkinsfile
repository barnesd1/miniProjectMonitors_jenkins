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
				sh 'pwd'
				sh 'mvn clean package'
				sh 'ls *.jar'
			}
		}
		stage('Run Jar') {
			steps {
				sh 'pwd'
				//java -jar miniProjectMonitors.jar
			}
		}
	}
	
}
