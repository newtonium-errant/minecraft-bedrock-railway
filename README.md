
```markdown
# Minecraft Bedrock Server on Railway

Minecraft Bedrock server with UDP tunneling via Playit.gg

## Deployment Steps

1. Fork/clone this repository
2. Create new project in Railway from this GitHub repo
3. Add environment variables in Railway:
   - `EULA=TRUE` (required)
   - `SERVER_NAME=My Server` (optional)
   - `GAMEMODE=survival` (optional)
   - `DIFFICULTY=normal` (optional)
4. Add volume mounted to `/data`
5. Deploy!

## After First Deploy

1. Check Railway logs
2. Look for Playit.gg claim URL (looks like: `https://playit.gg/claim/XXXXX`)
3. Visit that URL to claim your tunnel
4. Configure tunnel for:
   - Protocol: UDP
   - Local Port: 19132
   - Tunnel Type: Minecraft Bedrock
5. Get your public address from Playit.gg dashboard
6. Connect from Minecraft using that address

## Connecting

Use the address from your Playit.gg dashboard:
- Server Address: `[from playit.gg]`
- Port: `[from playit.gg]`

## Environment Variables

All standard Minecraft Bedrock variables work:
- `VERSION=LATEST`
- `GAMEMODE=survival|creative|adventure`
- `DIFFICULTY=peaceful|easy|normal|hard`
- `SERVER_NAME=Server Name`
- `MAX_PLAYERS=10`
- `ALLOW_CHEATS=false`
- `WHITE_LIST=false`
- `ONLINE_MODE=true`

See full list: https://github.com/itzg/docker-minecraft-bedrock-server
```
