pipeline {
    agent any   
    stages {
        stage('Checkout') {
            steps {
                echo "Start checkout project"
                sh 'env'
                step([$class: 'WsCleanup'])
                git url: 'https://github.com/msy53719/JmeterDashBoard.git', branch: 'master'
                echo 'get artifact from pulugins  pipeline.'
            }
        }
        
        stage('Smoking Test') {
            steps {
                sh 'env'
                echo 'execute test'
                sh 'sh ./execute_test/execute.sh'
            }
        }
        
    }
    post {
    
        always {
            echo 'package report'
            sh 'sh ./execute_test/report.sh'
            archiveArtifacts artifacts: 'test-report*.tar.gz', fingerprint: true
            publishHTML target: [
              allowMissing: false,
              alwaysLinkToLastBuild: false,
              keepAll: true,
              reportDir: './DashBoardReport/',
              reportFiles: 'index.html',
              reportName: 'Html Report'
            ]
            
        emailext attachLog: true, body: '测试报告地址：\n  ${BUILD_URL}/DashBoardReport/index.html', compressLog: true, subject: '测试报告地址', to: '479979298@qq.com'
            
           
        }
        failure {
            echo 'this area is run when failure'
        }
    }

}

