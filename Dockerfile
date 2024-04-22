# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    portaudio19-dev \
    libasound2-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to root in the container
WORKDIR /

# Copy both the requirements.txt and the Python script into the container at root
COPY requirements.txt ibm_speech_to_text.py /

# Install any necessary packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV NAME World

# Ensure Python output is sent straight to terminal (container log)
ENV PYTHONUNBUFFERED 1

# Run ibm_speech_to_text.py when the container launches
CMD ["python", "ibm_speech_to_text.py"]
