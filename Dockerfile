FROM python:3.10

# Install necessary packages
RUN apt-get update && apt-get install -y python3-venv python3-distutils python3-apt

# Set the working directory
WORKDIR /data

# Create a virtual environment
RUN python3 -m venv venv

# Activate the virtual environment and upgrade pip/setuptools
RUN . /data/venv/bin/activate && pip install --upgrade pip setuptools

# Add the virtual environment to PATH
ENV PATH="/data/venv/bin:$PATH"

# Install Django
RUN pip install django==3.2

# Copy the project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port 8000 for the application
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
