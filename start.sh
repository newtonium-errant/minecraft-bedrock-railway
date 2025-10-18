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
sleep 5

echo "Starting Minecraft Bedrock Server..."
exec /bedrock-entry.sh
