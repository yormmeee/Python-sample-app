# Python Sample App

Welcome to the Python Sample App repository! This project demonstrates how to create a simple Python web server using the `HTTPServer` library and how to containerize it using Docker. 

## Overview

- **Web Server**: Implements a basic HTTP server that responds with details about the client and server.
- **Containerization**: Dockerfile provided to build a secure Docker image.
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
   git clone https://github.com/yormmeee/Python-sample-app.git
   cd Python-sample-app
###Install Dependencies

Ensure you have Python 3.10 installed. No additional dependencies are required for this basic server.

Run the Server

- python3 web_server.py
- Test the Server

Open a browser or use curl to check the server’s response:

- curl localhost:8000
You should see a response with details about the client and server.

###Containerizing the Web Server
Build the Docker Image


- docker build -t secure-python-server .
Run the Docker Container


- docker run -d -p 8000:8000 secure-python-server
###Test the Container

After running the container, verify it by accessing:

- curl localhost:8000
