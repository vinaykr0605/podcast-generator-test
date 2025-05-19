FROM ubuntu:latest

# Install Python and required tools
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

# Create and activate a virtual environment
RUN python3 -m venv /venv

# Install PyYAML in the virtual environment
RUN /venv/bin/pip install --upgrade pip && /venv/bin/pip install PyYAML

# Copy your files
COPY feed.yaml /app/feed.yaml
COPY entrypoint.sh /entrypoint.sh

# Make sure entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
