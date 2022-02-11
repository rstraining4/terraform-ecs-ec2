pipeline {
    agent any 
    parameters {
		string(name: "git_codebase", defaultValue: "https://github.com/rstraining4/terraform-ecs-ec2.git", description: "git location of the updatedb app files")
}

	environment {
		image_version_ui=""
	}

//------------------------------------------
// Building DB Update jar
//------------------------------------------
    stages {
        stage('BUILD JAR') { 
            steps {
                    checkout scm
                    sh 'git log -n1 --format="%h"'
                    sh "ls -lat"
                    sh "pwd"
                    sh "/opt/apache-maven-3.3.1/bin/mvn clean install"
                    sh "mv target/sasaws-0.0.1-SNAPSHOT.jar ."
            }
        }

//------------------------------------------
// Docker Login
//------------------------------------------
        stage("Docker Login,build,push") {
           // when { branch 'master' }
            steps {

                 sh '''
					commitid=$(git log -n1 --format="%h")
					echo $commitid
					cwd=$(pwd)
                        # Get docker login command
                        docker_login_cmd=\$(aws ecr get-login --region eu-west-1 --no-include-email)

                        # Login to docker
                         eval \$docker_login_cmd
                        # Docker build
                        docker build -t demo-ui:$commitid -f Dockerfile .
                        docker tag demo-ui:$commitid xxxxxxxx.dkr.ecr.eu-west-1.amazonaws.com/demo-ui:$commitid
                        docker push xxxxxxxxxx.dkr.ecr.eu-west-1.amazonaws.com/demo-ui:$commitid
                        docker image rm demo-ui:$commitid
                        docker image rm xxxxxxxxxx.dkr.ecr.eu-west-1.amazonaws.com/demo-ui:$commitid
                    '''
            }
        }
//------------------------------------------------
// Update ECS task 
//------------------------------------------------
       	stage('Update ECS tasks & services') { 
            steps {
				script {
					image_version_ui = sh(script:'git log -n1 --format="%h"', returnStdout: true).trim()				
					build job: 'TERRAFORM-PROJECT-NAME', parameters: [[$class: 'StringParameterValue', name: 'terra_action', value: 'apply'], [$class: 'StringParameterValue', name: 'git_codebase', value: 'git@ec2-18-200-215-85.eu-west-1.compute.amazonaws.com:ibm-admin/sastoaws-infra.git'], [$class: 'StringParameterValue', name: 'main_dir_name', value: 'SAS_to_S3_Project/main'], [$class: 'StringParameterValue', name: 'tf_vars', value: "image_version_ui=${image_version_ui}"]]
				}
			}
        } 
    }
}