# Base stage
FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r /app/requirements.txt

# Development stage
FROM base as dev

# Copy the rest of the application code into the container
COPY . /app/

# Expose port 8000 (Django's default port)
EXPOSE 8000

# Run the Django app in development mode
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]