# Use an official Debian image
FROM debian:bullseye

# Install inotify-tools and Docker CLI
RUN apt-get update && apt-get install -y \
    inotify-tools \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

# Copy the watcher script
COPY watcher.sh /usr/local/bin/watcher.sh

# Set the script to be executable
RUN chmod +x /usr/local/bin/watcher.sh

# Set the default command to run the watcher script
CMD ["bash", "/usr/local/bin/watcher.sh"]

