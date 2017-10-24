HACK_IM   = hack-image
VICTIM_IM = victim-image

NETWORK   = mitm_net
SUBNET    = 192.168.26.0/24
GATEWAY   = 192.168.26.2


CONTAINER_A = vi-vic
IP_A        = 192.168.26.129 

CONTAINER_B = vi-root
IP_B        = 192.168.26.3 

HACK        = hack
IP_HACK	    = 192.168.26.10

DNS1    = 223.5.5.5
DNS2    = 223.6.6.6

DNSFLAG := --dns=$(DNS1) --dns=$(DNS2)
PFLAGS  := -itd --privileged

# network_name, subnet, gateway
docker_create_net = docker network create --subnet=$(2) --gateway=$(3) $(1)

# container_name, container_ip, image_name
docker_run = docker run --network=$(NETWORK) --ip=$(2) $(DNSFLAG) $(PFLAGS) --name=$(1) $(3)
docker_run = docker run --network=$(NETWORK) --ip=$(2) $(DNSFLAG) $(PFLAGS) --name=$(1) $(3)

# container_name
docker_exec = docker exec -it $(1) /bin/bash

# V         = @

create_gateway:
	$(V)$(call docker_create_net,$(NETWORK),$(SUBNET),$(GATEWAY))

rm_gateway:
	$(V)docker network rm $(NETWORK)

build:
	$(V)docker build -t $(HACK_IM) ./kali
	$(V)docker build -t $(VICTIM_IM) ./ubuntu

run:
	$(V)$(call docker_run,$(CONTAINER_A),$(IP_A),$(VICTIM_IM))
	$(V)$(call docker_run,$(CONTAINER_B),$(IP_B),$(VICTIM_IM))
	$(V)$(call docker_run,$(HACK),$(IP_HACK),$(HACK_IM))

exec_vic:
	$(V)$(call docker_exec,$(CONTAINER_A))

exec_root:
	$(V)$(call docker_exec,$(CONTAINER_B))

exec_hack:
	$(V)$(call docker_exec,$(HACK))

stop:
	$(V)docker stop $(CONTAINER_A) $(CONTAINER_B) $(HACK)

start:
	$(V)docker start $(CONTAINER_A) $(CONTAINER_B) $(HACK)

rm:
	$(V)docker rm $(CONTAINER_A) $(CONTAINER_B) $(HACK)
