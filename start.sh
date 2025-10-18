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
# Call the original entrypoint from the base image
exec bash -c ". /usr/local/bin/bedrock-entry"
