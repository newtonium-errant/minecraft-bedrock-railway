
```bash
#!/bin/bash
set -e

echo "Starting Playit.gg tunnel..."
playit &

echo "Waiting for playit to initialize..."
sleep 5

echo "Starting Minecraft Bedrock Server..."
exec /bedrock-entry.sh
```
