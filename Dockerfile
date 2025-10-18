```dockerfile
FROM itzg/minecraft-bedrock-server:latest

# Install dependencies and playit.gg
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor -o /usr/share/keyrings/playit-cloud.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/playit-cloud.gpg] https://playit-cloud.github.io/ppa/data ./" | tee /etc/apt/sources.list.d/playit-cloud.list && \
    apt-get update && \
    apt-get install -y playit && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Use custom startup script
CMD ["/start.sh"]
```
