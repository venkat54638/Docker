pipeline {
    agent any

    environment {
        VENV = 'venv'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage("Install") {
            steps {
                script {
                    // Create a virtual environment and install dependencies
                    sh '''
                        python3 -m venv $VENV
                        source $VENV/bin/activate
                        pip install --upgrade pip
                        pip install -r requirements.txt
                    '''
                }
            }
        }
        
        stage("Linting") {
            steps {
                script {
                    echo "This is my Linting Step"
                    // Example: run a linter like flake8
                    sh '''
                        source $VENV/bin/activate
                        flake8 .
                    '''
                }
            }
        }

        stage("Install Packages") {
            steps {
                script {
                    echo "This is Install Packages Step"
                    // Example: Installing additional packages, if needed
                    sh '''
                        source $VENV/bin/activate
                        pip install some-additional-package
                    '''
                }
            }
        }

        stage("Run Application") {
            steps {
                script {
                    echo "This is my Run Application Step"
                    // Example: Run your application here
                    sh '''
                        source $VENV/bin/activate
                        python app.py
                    '''
                }
            }
        }
    }
}
