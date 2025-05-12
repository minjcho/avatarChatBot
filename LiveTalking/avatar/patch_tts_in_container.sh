#!/bin/bash

# Find the running container name for avatar-app
target_container=$(docker ps --filter "name=avatar-app-run" --format "{{.Names}}" | head -n 1)

if [ -z "$target_container" ]; then
  echo "No running avatar-app container found. Please start it with make dev or similar."
  exit 1
fi

echo "Found running container: $target_container"

# Path inside the container where tts.py should be patched
container_tts_path="/usr/local/lib/python3.11/site-packages/livekit/agents/tts/tts.py"

# Copy the patch file into the container
docker cp tts_patch.py "$target_container":"$container_tts_path"

if [ $? -eq 0 ]; then
  echo "Successfully patched tts.py in $target_container."
else
  echo "Failed to patch tts.py in $target_container."
  exit 2
fi 