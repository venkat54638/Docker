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
                        . $VENV/bin/activate  # Use dot instead of source
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
                        . $VENV/bin/activate  # Use dot instead of source
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
                        . $VENV/bin/activate  # Use dot instead of source
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
                        . $VENV/bin/activate  # Use dot instead of source
                        python app.py
                    '''
                }
            }
        }
    }
}
