# Use the latest Ubuntu base image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  python3.10 \
  python3-pip \
  git && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install required Python package
RUN pip3 install --no-cache-dir PyYAML

# Copy necessary files to the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script has execute permissions
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
 