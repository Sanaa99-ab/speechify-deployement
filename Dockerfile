# Use an official Python runtime as a parent image
FROM python:3.9-slim
# Install system dependencies

RUN apt-get update && apt-get install -y \
    portaudio19-dev \
    libasound2-dev \
    && rm -rf /var/lib/apt/lists/*


# Set the working directory to /app in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY requirements.txt /app/
#RUN ls -la
# Copy the current directory contents into the container at /usr/src/app


# List all files in the current directory (temporary debugging step)


# Install any necessary packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV NAME World

# Ensure Python output is sent straight to terminal (container log)
ENV PYTHONUNBUFFERED 1

# Run ibm_speech_to_text.py when the container launches
CMD ["python", "/app/ibm_speech_to_text.py"]
