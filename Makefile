V         = @

IDS_DIR     := ids
CLIENT_DIR  := client

IDS_IMAGE    := ids-image
CLIENT_IMAGE := client-image

NETWORK     := ids-net
SUBNET      := 192.168.144.0/24
GATEWAY     := 192.168.144.2

CONT_IDS    := ids
IP_IDS      := 192.168.144.131

CONT_CLIENT := client
IP_CLIENT   := 192.168.144.130

NETWORK2    := ids-outer-net
SUBNET2     := 192.168.53.0/24
GATEWAY2    := 192.168.53.2

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


default: build run net_config

create_gateway:
	$(V)$(call docker_create_net,$(NETWORK),$(SUBNET),$(GATEWAY))
	$(V)$(call docker_create_net,$(NETWORK2),$(SUBNET2),$(GATEWAY2))

rm_gateway:
	$(V)docker network rm $(NETWORK) $(NETWORK2)

build:
	$(V)docker build -t $(IDS_IMAGE) $(IDS_DIR)
	$(V)docker build -t $(CLIENT_IMAGE) $(CLIENT_DIR)

run:
	$(V)$(call docker_run,$(CONT_IDS),$(IP_IDS),$(IDS_IMAGE))
	$(V)$(call docker_run,$(CONT_CLIENT),$(IP_CLIENT),$(CLIENT_IMAGE))

net_config:
	$(V)docker network connect $(NETWORK2) $(CONT_IDS)
	$(V)$(call docker_exec,$(CONT_CLIENT)) -c "route del default gw $(GATEWAY)"
	$(V)$(call docker_exec,$(CONT_CLIENT)) -c "route add default gw $(IP_IDS)"
#	$(V)$(call docker_exec,$(CONT_IDS)) -c \
#		"iptables -A OUTPUT -p tcp --tcp-flags RST RST -s $(IP_CLIENT) -j DROP"
	$(V)$(call docker_exec,$(CONT_IDS)) -c \
		"iptables -t nat -A POSTROUTING -s $(SUBNET) -d 0.0.0.0/0 -o eth1 -j MASQUERADE"

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

clean: stop rm