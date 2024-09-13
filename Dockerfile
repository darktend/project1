# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install system dependencies required for psycopg2 and other packages
RUN apt-get update && \
    apt-get install -y gcc libpq-dev libssl-dev build-essential && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose port 80
EXPOSE 80

# Run the Django app
CMD ["python", "manage.py",]
