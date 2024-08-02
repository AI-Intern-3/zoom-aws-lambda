# Use a lightweight Python base image
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY app/ app/

# Expose the port for the Flask application
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app/app.py"]
