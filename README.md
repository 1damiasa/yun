Deployment Setup for Python Flask App with Docker, Minikube, Kubernetes, and Terraform
This guide describes the steps to set up a Python Flask app with Docker, Minikube, Kubernetes, and Terraform on an EC2 instance. It also includes the setup for a CI/CD pipeline using GitHub Actions.


Steps to Setup the Environment
1. Launch EC2 Instance
Launch an EC2 instance on AWS (Ubuntu 20.04 recommended).
SSH into the instance once it is up and running.

2. Install Dependencies
Install Docker
Update the package list and install dependencies.
Add Docker’s official GPG key.
Set up the Docker repository.
Install Docker.
Verify the Docker installation.
Install Minikube
Install necessary dependencies for Minikube.
Download and install Minikube.
Verify Minikube installation.
Install kubectl
Install kubectl (command-line tool for Kubernetes).
Verify kubectl installation.
Install Terraform
Install the necessary key for HashiCorp.
Add HashiCorp’s official repository.
Install Terraform.
Verify Terraform installation.

3. Create Python Flask Project

Create a new project directory for your app.
Inside the project directory, create a simple Python Flask app.
Create a Dockerfile to build a container for the Flask app.
Build the Docker image for the app.

4. Setup Kubernetes Deployment with Terraform

Install and configure Terraform.
Define the Kubernetes provider in main.tf.
Create a Kubernetes deployment resource to deploy the app.
Create a Kubernetes service resource to expose the app.
Run Terraform commands (terraform init, terraform apply) to apply the changes.

5. Set Up CI/CD Pipeline with GitHub Actions

Set up a GitHub repository for your project.
Create an SSH key pair to allow GitHub Actions to access the EC2 instance securely.
Add the private key as a secret in your GitHub repository (e.g., SSH_PRIVATE_KEY).
Create a .github/workflows/ci-cd.yml file in the repository with the following steps:
Checkout code: Ensure the latest code is pulled from the repository.
Set up SSH key: Set up SSH to securely connect to the EC2 instance.
SSH into the VM and Pull Latest Code:
SSH into the EC2 instance and pull the latest code.
Build the Docker image and run a security scan (e.g., Trivy).
Copy the latest code to the Kubernetes container using kubectl cp.
Trigger a deployment restart using kubectl rollout restart.
Rollback Deployment if Security Scan Fails: If the security scan fails, roll back the deployment using kubectl rollout undo.

6. Security Scanning for Docker Images
Use Trivy or a similar security tool to scan the Docker image for vulnerabilities.
If vulnerabilities are found, stop the deployment and rollback the changes.
7. Final Deployment
After passing the security scan, the deployment will proceed, and the new image will be applied to the Kubernetes cluster.
Monitor the deployment and verify the app is running successfully.
