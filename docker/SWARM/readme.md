
# Add plugin docker-compose to vagrant
vagrant plugin install vagrant-docker-compose


INIT SWARM

1. instalacja maszyn:
~ vagrant up
- tworzy 3 maszyny: manager,worker1,worker2

2. init swarm
~ AUTO_START_SWARM=true vagrant provision

# ALBO
1+2. instalacja maszyn + init swarm ! ustawić zmienną AUTO_START_SWARM na true
~ AUTO_START_SWARM=true vagrant up