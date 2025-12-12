pipeline{
    agent any
    stages{
        stage('git checkout'){
            steps{
                git url: 'https://github.com/zerajudeenakazera/react-ecom.git', branch: 'main'
            }
        }
        stage('docker build'){
            steps{
                sh 'echo building docker image'
                sh 'docker build -t reactapplication:latest .'
            }
        }
        stage('deploy to eks'){
            steps{
                sh 'echo deploying to eks'
                sh 'aws eks update-kubeconfig --region ap-south-1 --name democluster'
                sh 'kubectl apply -f deployment.yaml --validate=false'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
    post{
        success{
            echo 'pipeline completed'
        }
        failure{
            echo 'failed!!!!! please check logs'
        }
    }
}
