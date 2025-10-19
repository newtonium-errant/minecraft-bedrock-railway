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
# Create ops file with operator access for all players
echo "Setting up operator permissions..."
mkdir -p /data
cat > /data/ops.json << 'EOF'
[
  {
    "name": "MrBruh8498",
    "xuid": "2535432322898225",
    "level": 4
  },
  {
    "name": "Plant78904",
    "xuid": "2535467885159423",
    "level": 4
  },
  {
    "name": "Rose64410",
    "xuid": "2535411375793997",
    "level": 4
  }
]
EOF
echo "Starting Minecraft Bedrock Server..."
exec /usr/local/bin/entrypoint-demoter --match /data --debug --stdin-on-term stop /opt/bedrock-entry.sh
