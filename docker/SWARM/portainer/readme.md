DOC: https://docs.portainer.io/v/ce-2.11/start/install/server/swarm/linux

curl -L https://downloads.portainer.io/portainer-agent-stack.yml \
    -o portainer-agent-stack.yml
docker stack deploy -c portainer-agent-stack.yml portainer
