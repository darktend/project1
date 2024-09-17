# Use the official Python image as the base image
FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install psycopg2-binary separately
RUN pip install --upgrade pip && pip install psycopg2-binary==2.9.6

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose port 8000 for Django
EXPOSE 6379

# Run the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:6379"]
