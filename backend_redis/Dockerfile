FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies for PostgreSQL and other utilities
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc libpq-dev python3-dev build-essential

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the required Python packages
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the rest of the application code into the container

COPY . /app/


# Expose the port that Django will run on

EXPOSE 8001



# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
