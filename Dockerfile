# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory to /app in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any necessary packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5501

# Define environment variables if needed (e.g., API keys, configuration settings)
# ENV API_KEY="YOUR_API_KEY_HERE"

# Run ibm_speech_to_text.py when the container launches
CMD ["python", "ibm_speech_to_text.py"]
