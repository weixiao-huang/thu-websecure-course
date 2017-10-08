IMAGE     = kali

NETWORK   = my_network
SUBNET    = 192.168.26.0/24
GATEWAY   = 192.168.26.2


CONTAINER_A = kali_a
IP_A        = 192.168.26.129 

CONTAINER_B = kali_b
IP_B        = 192.168.26.3 

DNS1    = 223.5.5.5
DNS2    = 223.6.6.6

# network name, subnet, gateway
docker_create_net = docker network create --subnet=$(2) --gateway=$(3) $(1)

# container name, container ip
docker_run = docker run --network=$(NETWORK) --ip=$(2) --dns=$(DNS1) --dns=$(DNS2) -itd --privileged --name=$(1) $(IMAGE)

# container name
docker_exec = docker exec -it $(1) /bin/bash

V         = @

create_gateway:
	$(V)$(call docker_create_net,$(NETWORK),$(SUBNET),$(GATEWAY))

rm_gateway:
	$(V)docker network rm $(NETWORK)

build:
	$(V)docker build -t $(IMAGE) .

run:
	$(V)$(call docker_run,$(CONTAINER_A),$(IP_A))
	$(V)$(call docker_run,$(CONTAINER_B),$(IP_B))

exec_a:
	$(V)$(call docker_exec,$(CONTAINER_A))

exec_b:
	$(V)$(call docker_exec,$(CONTAINER_B))


stop:
	$(V)docker stop $(CONTAINER_A) $(CONTAINER_B)

start:
	$(V)docker start $(CONTAINER_A) $(CONTAINER_B)

rm:
	$(V)docker rm $(CONTAINER_A) $(CONTAINER_B)
