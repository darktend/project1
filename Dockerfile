# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose port 80
EXPOSE 80

# Run the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
