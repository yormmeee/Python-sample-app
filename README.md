# Assessment Project

Welcome to the Assessment Project repository! This project demonstrates various skills in developing a web server, securing container images, creating Helm charts, integrating CI/CD systems, implementing Kubernetes RBAC, and automating AWS security with Terraform.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Exercise 1: Developing a Simple Web Server](#exercise-1-developing-a-simple-web-server)
3. [Exercise 2: Securing Container Images](#exercise-2-securing-container-images)
4. [Exercise 3: Creating a Secure Helm Chart](#exercise-3-creating-a-secure-helm-chart)
5. [Exercise 4: Build and Deploy the Application in a CI/CD System](#exercise-4-build-and-deploy-the-application-in-a-cicd-system)
6. [Exercise 5: Implementing Role-Based Access Control (RBAC)](#exercise-5-implementing-role-based-access-control-rbac)
7. [Exercise 6: AWS Automation with Terraform](#exercise-6-aws-automation-with-terraform)
8. [Submission Instructions](#submission-instructions)
9. [Conclusion](#conclusion)

## Prerequisites

Make sure you have the following installed:

- **Python 3.10**: For the web server development.
- **Docker**: For containerizing the application.
- **Helm**: For managing Kubernetes applications.
- **Git**: For version control and cloning the repository.
- **Kubectl**: For interacting with Kubernetes clusters.
- **Terraform**: For AWS infrastructure automation.
- **Trivy**: For scanning Docker images for vulnerabilities.
- **A Kubernetes Cluster**: (e.g., EKS, Minikube) for deploying the Helm chart and managing RBAC.

## Exercise 1: Developing a Simple Web Server

### Overview

This exercise demonstrates how to create a simple web server using the `HTTPServer` library in Python. The server listens on port 8000 and responds with client and server details for each request.


### Running the Web Server Locally

1. **Clone the Repository**

    ```bash
    git clone https://github.com/yormmeee/Python-sample-app.git
    cd Python-sample-app
    ```

2. **Install Dependencies**

    Ensure you have Python 3.10 installed. No additional dependencies are required for this basic server.

3. **Run the Server**

    ```bash
    python3 web_server.py
    ```

4. **Test the Server**

    Open a browser or use `curl` to check the server’s response:

    ```bash
    curl localhost:8000
    ```

    You should see a response with details about the client and server.

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
    curl localhost:8000
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
curl localhost:8000
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



## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

