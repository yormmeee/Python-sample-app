# Python Sample App

Welcome to the Python Sample App repository! This project demonstrates how to create a simple Python web server using the `HTTPServer` library and how to containerize it using Docker.

## Overview

- **Web Server**: Implements a basic HTTP server that responds with details about the client and server.
- **Containerization**: Includes a Dockerfile to build a secure Docker image.
- **Security**: Follows best practices for container security.

## Features

- A Python web server that listens on port 8000.
- Dockerized application with security best practices.
- Instructions for building and running the Docker container.
- Vulnerability scanning with Trivy.

## Getting Started

### Prerequisites

- Python 3.x
- Docker
- Trivy (for vulnerability scanning)

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

## Security

- **Vulnerability Scanning**: Use Trivy to scan the Docker image for vulnerabilities. Instructions for using Trivy can be found in the [Trivy documentation](https://aquasecurity.github.io/trivy/latest/docs/).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

