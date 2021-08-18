#Jenkinsfile
pipeline {
	agent any
	stages {
		stage('Clone Repo') {
			steps {
				sh 'git clone https://github.com/barnesd1/miniProjectMonitors_jenkins.git'
			}
		}
		stage('Build Jar') {
			steps {
				pwd
				sh 'mvn clean package'
				ls *.jar
			}
		}
		stage('Run Jar') {
			steps {
				pwd
				#java -jar miniProjectMonitors.jar
			}
		}
	}
	
}
