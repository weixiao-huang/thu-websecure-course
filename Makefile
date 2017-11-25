IDS_IMAGE   := ids-image

NETWORK     := ids-net
SUBNET      := 192.168.144.0/24
GATEWAY     := 192.168.144.2

CONT_IDS    := ids
IP_IDS      := 192.168.144.131

CONT_CLIENT := client
IP_CLIENT   := 192.168.144.130


# DNS Settings
DNS1    = 223.5.5.5
DNS2    = 223.6.6.6

CONTS   = $(CONT_IDS) $(CONT_CLIENT)

# Flags
DNSFLAG := --dns=$(DNS1) --dns=$(DNS2)
PFLAGS  := -itd --privileged

# network_name, subnet, gateway
docker_create_net = docker network create --subnet=$(2) --gateway=$(3) $(1)

# container_name, container_ip, image_name
docker_run = docker run --network=$(NETWORK) --ip=$(2) $(DNSFLAG) $(PFLAGS) --name=$(1) $(3)

# container_name
docker_exec = docker exec -it $(1) /bin/bash

V         = @

create_gateway:
	$(V)$(call docker_create_net,$(NETWORK),$(SUBNET),$(GATEWAY))

rm_gateway:
	$(V)docker network rm $(NETWORK)

build:
	$(V)docker build -t $(IDS_IMAGE) ./ids

run:
	$(V)$(call docker_run,$(CONT_IDS),$(IP_IDS),$(IDS_IMAGE))
	$(V)$(call docker_run,$(CONT_CLIENT),$(IP_CLIENT),$(IDS_IMAGE))

exec_ids:
	$(V)$(call docker_exec,$(CONT_IDS))

exec_client:
	$(V)$(call docker_exec,$(CONT_CLIENT))

stop:
	$(V)docker stop $(CONTS)

start:
	$(V)docker start $(CONTS)

rm:
	$(V)docker rm $(CONTS)