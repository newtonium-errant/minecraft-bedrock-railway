#!/bin/bash
set -e

echo "Starting Playit.gg with tunnel configuration..."
if [ -n "$PLAYIT_SECRET" ]; then
    echo "Using provided secret key"
    playit --secret "$PLAYIT_SECRET" --port 19132 --proto udp &
else
    playit &
fi

echo "Waiting for playit to initialize..."
sleep 10

echo "Starting Minecraft Bedrock Server..."
if [ -f "/usr/local/bin/bedrock-entry" ]; then
    exec /usr/local/bin/bedrock-entry
elif [ -f "/bedrock-entry.sh" ]; then
    exec /bedrock-entry.sh
else
    exec /usr/bin/bedrock-entry
fi
