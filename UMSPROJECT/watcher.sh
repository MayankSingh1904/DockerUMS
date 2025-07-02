#!/bin/bash

# Watch for changes in the app folder
while inotifywait -e modify,create,delete -r /app; do
  echo "Changes detected. Rebuilding the ums-app container..."
  docker-compose build ums-app
  docker-compose up -d ums-app
done
