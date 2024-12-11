FROM python:3

# Install system dependencies for Python
RUN apt-get update && apt-get install -y python3-venv python3-distutils

# Set the working directory
WORKDIR /data

# Create and activate a virtual environment
RUN python3 -m venv venv
ENV PATH="/data/venv/bin:$PATH"

# Install Python dependencies
RUN pip install django==3.2

# Copy project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate



