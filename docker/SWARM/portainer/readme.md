
# DOC: https://docs.portainer.io/v/ce-2.11/start/install/server/swarm/linux

# Download docker-compose file
curl -L https://downloads.portainer.io/portainer-agent-stack.yml \
    -o portainer-agent-stack.yml
# Start app portainer
docker stack deploy -c portainer-agent-stack.yml portainer

# WEB (host)
https://127.0.0.1:29443/