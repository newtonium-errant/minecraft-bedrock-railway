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

# Enable cheats and set player permissions in server.properties
echo "Configuring server permissions..."
mkdir -p /data
cat >> /data/server.properties << 'EOF'
allow-cheats=true
EOF

# Start server in background
echo "Starting Minecraft Bedrock Server..."
/usr/local/bin/entrypoint-demoter --match /data --debug --stdin-on-term stop /opt/bedrock-entry.sh &
SERVER_PID=$!

# Wait for server to start
sleep 30

# Monitor and auto-op new players
echo "Starting auto-op monitor..."
(
  while true; do
    if [ -f /data/valid_known_packs.json ]; then
      # Server is running, check for new players
      for player in $(find /data/worlds/*/db/player_*.dat 2>/dev/null | xargs -n1 basename 2>/dev/null | sed 's/player_//;s/.dat//' | sort -u); do
        # Try to op each player found in the world data
        echo "op ${player}" > /data/stdin 2>/dev/null || true
      done
    fi
    sleep 60
  done
) &

# Wait for server process
wait $SERVER_PID
