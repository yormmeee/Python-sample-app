# Assessment Project

Welcome to the Assessment Project repository! This project demonstrates various skills in developing a web server, securing container images, creating Helm charts, integrating CI/CD systems, implementing Kubernetes RBAC, and automating AWS security with Terraform.
## Overview

- **Web Server**: A basic HTTP server that responds with client and server information.
- **Containerization**: Dockerfile to build a secure Docker image.
- **Deployment**: Instructions for running the server locally or in a container.
- **CI/CD**: Automated integration and deployment using GitHub Actions.
- **Kubernetes RBAC**: Role-based access control for managing access to resources.
- **AWS Automation**: Terraform scripts to manage S3 bucket security.
## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Exercise 1: Developing a Simple Web Server](#exercise-1-developing-a-simple-web-server)
3. [Exercise 2: Securing Container Images](#exercise-2-securing-container-images)
4. [Exercise 3: Deploying with Helm](#exercise-3-deploying-with-helm)
5. [Exercise 4: Build and Deploy the Application in a CI/CD System](#exercise-4-build-and-deploy-the-application-in-a-cicd-system)
6. [Exercise 5: Implementing RBAC in Kubernetes](#exercise-5-implementing-rbac-in-kubernetes)
7. [Exercise 6: AWS Automation with Terraform](#exercise-6-aws-automation-with-terraform)


## Prerequisites

Before running the project, ensure you have the following installed:

- **Python 3.10**: For the web server development.
- **Docker**: For containerizing the application.
- **Helm**: For managing Kubernetes applications.
- **Git**: For version control and cloning the repository.
- **Kubectl**: For interacting with Kubernetes clusters.
- **Terraform**: For AWS infrastructure automation.
- **Trivy**: For scanning Docker images for vulnerabilities.
- **A Kubernetes Cluster & AWS cli**: EKS for deploying the Helm chart and managing RBAC.

## Getting Started

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/Python-Web-Server.git
cd Python-Web-Server
```
## Exercise 1: Developing a Simple Web Server

### Overview

This exercise demonstrates how to create a simple web server using the `HTTPServer` library in Python. The server listens on port 8000 and responds with client and server details for each request.


1. **Install Dependencies**

    Ensure you have Python 3.10 installed. No additional dependencies are required for this basic server.

2. **Run the Server**

    ```bash
    python3 web_server.py
    ```

3. **Test the Server**

    Open a browser or use `curl` to check the server’s response:

    ```bash
    curl localhost:8000
    ```

    You should see a response.

### Containerizing the Web Server

1. **Build the Docker Image**

    ```bash
    docker build -t secure-python-server .
    ```

2. **Run the Docker Container**

    ```bash
    docker run -d -p 8000:8000 secure-python-server
    ```

3. **Test the Container**

    After running the container, verify it by accessing:

    ```bash
    curl http://localhost:8000
    ```

    You should receive a similar response as when running the server locally.

## Exercise 2: Securing Container Images
### Overview
In this exercise, a Dockerfile is created for the Python web application, implementing security best practices and scanning the image for vulnerabilities.

### Features
Dockerfile that uses a minimal base image.
Instructions for building and running the Docker container.
Vulnerability scanning using Trivy.
## Steps
 #### 1. Containerizing the Web Server

## Build the Docker Image

 ```bash
docker build -t secure-python-server .
 ```
Run the Docker Container

 ```bash
docker run -d -p 8000:8000 secure-python-server
 ```
Test the Container After running the container, verify it by accessing:
 ```bash
curl http://localhost:8000
 ```
You should receive a similar response as when running the server locally.

### Security Scanning Use Trivy to scan the image:

 ```bash
trivy image secure-python-server
 ```
Address any vulnerabilities reported by following the recommendations provided by Trivy.

### Base Image Explanation
The chosen base image python:3.10-slim is minimal, reducing the attack surface while still including necessary Python libraries. It follows best practices for security and performance.

- **Vulnerability Scanning**: Use Trivy to scan the Docker image for vulnerabilities. Instructions for using Trivy can be found in the [Trivy documentation](https://aquasecurity.github.io/trivy/latest/docs/).

## Exercise 3: Deploying with Helm
Deploy the Helm Chart:

### Deploy the Application
Deploy the application using Helm:

 ```bash
helm install web-server ./helm
 ```
## Exercise 4: Build and Deploy the Application in a CI/CD System
This section outlines how to set up a CI/CD pipeline to automate the build and deployment of the Python web server application using GitHub Actions.

## Prerequisites

Before setting up the CI/CD pipeline, ensure you have the following:

- A GitHub repository containing the Python web server application.
- An AWS account with permissions to access Elastic Container Registry (ECR) and Elastic Kubernetes Service (EKS).

## Required Environment Variables

The following environment variables must be set in your GitHub repository's Secrets for the CI/CD pipeline to work:

- **`AWS_ACCESS_KEY_ID`**: Your AWS Access Key ID.
- **`AWS_SECRET_ACCESS_KEY`**: Your AWS Secret Access Key.
- **`AWS_ACCOUNT_ID`**: Your AWS Account ID (without dashes).
- **`AWS_REGION`**: The AWS region where your ECR and EKS are located (e.g., `us-east-1`).
- **`CLUSTER_NAME`**: The name of your EKS cluster.
- **`ECR_REPOSITORY`**: The name of your ECR repository where the Docker image will be pushed.

## Exercise 5: Implementing RBAC in Kubernetes
- Set up RBAC policies in a Kubernetes cluster to manage user permissions effectively.
- Grant specific access to developers and monitoring teams.
 #### 1. Navigate to the Kubernetes directory:
```bash
cd k8s
```
 #### 2. Apply the Developer Role:

This role allows developers to manage deployments in a specific namespace.

 ```bash
kubectl apply -f roles/developer-role.yaml
 ```
 #### 3. Apply the Monitor Cluster Role:

This role grants read-only access to all resources in the cluster.

 ```bash
kubectl apply -f roles/monitor-cluster-role.yaml
 ```
 #### 4. Create Role Bindings:

Bind the developer role to the specified user.
```bash
kubectl apply -f bindings/developer-role-binding.yaml
```
Bind the monitor role to the specified user.

```bash
kubectl apply -f bindings/monitor-cluster-role-binding.yaml
```
## Exercise 6: AWS Automation with Terraform
- To set up S3 bucket security, navigate to the exercise folder and run:
 ```bash
cd terraform
terraform init
terraform apply
 ```



## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

