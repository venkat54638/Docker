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

        stage('Install Dependencies') {
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

        stage('Linting') {
            steps {
                script {
                    echo "Running Linting Step"
                    // Run the linter (e.g., flake8)
                    sh '''
                        source $VENV/bin/activate
                        flake8 .
                    '''
                }
            }
        }

        stage('Install Additional Packages') {
            steps {
                script {
                    echo "Installing Additional Packages"
                    // Example: Install any additional package, if needed
                    sh '''
                        source $VENV/bin/activate
                        pip install some-additional-package
                    '''
                }
            }
        }

        stage('Run Application') {
            steps {
                script {
                    echo "Running Application"
                    // Run your application here (e.g., FastAPI app)
                    sh '''
                        source $VENV/bin/activate
                        python app.py
                    '''
                }
            }
        }
    }
}
