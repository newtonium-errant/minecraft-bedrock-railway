#!/bin/bash
set -e

echo "Starting Playit.gg tunnel..."
if [ -n "$PLAYIT_SECRET" ]; then
    echo "Using provided secret key"
    playit --secret "$PLAYIT_SECRET" &
else
    echo "No secret key provided, starting in claim mode"
    playit &
fi

echo "Waiting for playit to initialize..."
sleep 10

echo "Starting Minecraft Bedrock Server..."
# Use the full entrypoint command from the base image
exec /usr/local/bin/entrypoint-demoter --match /data --debug --stdin-on-term stop /opt/bedrock-entry.sh
