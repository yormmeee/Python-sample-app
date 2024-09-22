# Use a minimal, secure base image
FROM python:3.12-slim

# Set environment variable to ensure Python doesn't buffer outputs
ENV PYTHONUNBUFFERED=1

# Create a non-root user for running the app
RUN useradd -ms /bin/bash webuser

# Set the working directory
WORKDIR /app

# Copy only necessary files
COPY web_server.py /app/

# Install essential dependencies (no external dependencies required for this server)
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Switch to the non-root user
USER webuser

# Expose port 8000
EXPOSE 8000

# Run the server
CMD ["python3", "web_server.py"]
