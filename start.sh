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

# Create permissions file with operator access
echo "Setting up operator permissions..."
mkdir -p /data
cat > /data/permissions.json << 'EOF'
[
  {
    "permission": "operator",
    "xuid": "2535432322898225"
  }
]
EOF

echo "Starting Minecraft Bedrock Server..."
exec /usr/local/bin/entrypoint-demoter --match /data --debug --stdin-on-term stop /opt/bedrock-entry.sh
