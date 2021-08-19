pipeline {
	agent any
	stages {
		stage('Clone Repo') {
			steps {
				
				sh "if [ ! -d 'miniProjectMonitors_jenkins' ]; then ;git clone https://github.com/barnesd1/miniProjectMonitors_jenkins.git; else; git pull https://github.com/barnesd1/miniProjectMonitors_jenkins.git; fi"
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
