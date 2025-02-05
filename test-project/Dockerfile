# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application code into the container
COPY python.py .

# Install the required dependencies
RUN pip install flask

# Expose the application port
EXPOSE 5000

# Run the Flask application
CMD ["python", "python.py"]
