pipeline {
	agent any
	stages {
		stage('Clone Repo') {
			steps {
				sh 'git pull https://github.com/barnesd1/miniProjectMonitors_jenkins.git || git clone https://github.com/barnesd1/miniProjectMonitors_jenkins.git'
			}
		}
		stage('Test Application'){
			steps{
			sh 'mvn clean test'
			}
		}
		stage('Save Tests'){
			steps{
			sh 'mkdir -p /home/jenkins/Tests/${BUILD_NUMBER}_tests/'
			sh 'mv ./target/surefire-reports/*.txt /home/jenkins/Tests/${BUILD_NUMBER}_tests/'
			}
		}
		stage('Build Jar') {
			steps {
				sh 'mvn clean package'
			}
		}
				stage('Moving Jar'){
			steps{
			sh 'mkdir -p /home/jenkins/jars'
			sh 'mkdir -p /home/jenkins/appservice'
			sh 'mv ./target/*.jar /home/jenkins/jars/monitors_jar.jar'
			}
                }
		stage('Stopping Service'){
			steps{
			sh 'bash stopService.sh'
			}
		}
		stage('Create new service file'){
			steps{
			sh ''' echo '#!/bin/bash
sudo java -jar /home/jenkins/jars/monitors_jar.jar' > /home/jenkins/appservice/start.sh
sudo chmod +x /home/jenkins/appservice/start.sh'''
			sh '''echo '[Unit]
Description=Monitors SpringBoot App
[Service]
User=ubuntu
Type=simple
ExecStart=/home/jenkins/appservice/start.sh
[Install]
WantedBy=multi-user.target' > /home/jenkins/monitors.service'''
			sh'sudo mv /home/jenkins/monitors.service /etc/systemd/system/monitors.service'
			}
		}
		stage('Reload and start service'){
			steps{
			sh 'sudo systemctl daemon-reload'
			sh 'sudo systemctl start monitors.service'
			}
		}
	}
	
}
