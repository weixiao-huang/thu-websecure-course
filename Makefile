V         = @

#************* IMAGES, CONTAINERS ****************#
#--------------------------------------------------
# IDS Configs
#--------------------------------------------------
IDS_DIR      := ids
IDS_IMAGE    := ids-image
CONT_IDS     := ids
IP_IDS       := 192.168.144.131
IP_IDS2      := 192.168.53.130

#--------------------------------------------------
# Client Configs
#--------------------------------------------------
CLIENT_DIR   := client
CLIENT_IMAGE := client-image
CONT_CLIENT  := client
IP_CLIENT    := 192.168.144.130

#--------------------------------------------------
# Server Configs
#--------------------------------------------------
SERVER_DIR   := server
SERVER_IMAGE := server-image
CONT_SERVER  := server
IP_SERVER    := 192.168.53.131


#******************* NETWORKS ********************#
#--------------------------------------------------
# Inner Network Configs
#--------------------------------------------------
NETWORK     := ids-net
SUBNET      := 192.168.144.0/24
GATEWAY     := 192.168.144.2

#--------------------------------------------------
# Outer Network Configs
#--------------------------------------------------
# NETWORK2    := bridge
NETWORK2    := outer-net
SUBNET2     := 192.168.53.0/24
GATEWAY2    := 192.168.53.2


#--------------------------------------------------
# Socks5 Configs
#--------------------------------------------------
# Environment Variables
SERVER_PORT := 12315
CLIENT_PORT := 12345

# Socks5 Proxy Server
PROXY_DIR   := proxy
PROXY_IMAGE := proxy-image
CONT_PROXY  := proxy
IP_PROXY    := 192.168.53.66

PROXY_ENVS  := -e "SERVER_PORT=$(SERVER_PORT)"

CLIENT_ENVS := -e "SERVER_PORT=$(SERVER_PORT)" \
	-e "CLIENT_PORT=$(CLIENT_PORT)" \
	-e "SERVER_IP=$(IP_PROXY)"


#******************** OTHERS *********************#
# DNS
DNS1    = 223.5.5.5
DNS2    = 223.6.6.6

# ALl Contianers
CONTS   = $(CONT_IDS) $(CONT_CLIENT) $(CONT_SERVER) $(CONT_PROXY)
NETS    = $(NETWORK) $(NETWORK2)

# Flags
DNSFLAG := --dns=$(DNS1) --dns=$(DNS2)
PFLAGS  := -itd --privileged

# network_name, subnet, gateway
docker_create_net = docker network create --subnet=$(2) --gateway=$(3) $(1)

# container_name, container_ip, image_name
docker_run = docker run \
	--network=$(4) --ip=$(2) \
	$(DNSFLAG) $(PFLAGS) \
	-v $(CURDIR)/$(5)/src:/usr/src/app \
	$(6) \
	--name=$(1) $(3)

# container_name
docker_exec = docker exec -it $(1) /bin/bash


#****************** Procedures ********************#
default: build run net_config

create_gateway:
	$(V)$(call docker_create_net,$(NETWORK),$(SUBNET),$(GATEWAY))
	$(V)$(call docker_create_net,$(NETWORK2),$(SUBNET2),$(GATEWAY2))

rm_gateway:
	$(V)docker network rm $(NETS)

build:
	$(V)docker build -t $(IDS_IMAGE) $(IDS_DIR)
	$(V)docker build -t $(CLIENT_IMAGE) $(CLIENT_DIR)
	$(V)docker build -t $(SERVER_IMAGE) $(SERVER_DIR)
	$(V)docker build -t $(PROXY_IMAGE) $(PROXY_DIR)

run:
	$(V)$(call docker_run,$(CONT_CLIENT),$(IP_CLIENT),$(CLIENT_IMAGE),$(NETWORK),$(CLIENT_DIR),$(CLIENT_ENVS))
	$(V)$(call docker_run,$(CONT_IDS),$(IP_IDS),$(IDS_IMAGE),$(NETWORK),$(IDS_DIR))
	$(V)$(call docker_run,$(CONT_SERVER),$(IP_SERVER),$(SERVER_IMAGE),$(NETWORK2),$(SERVER_DIR))
	$(V)$(call docker_run,$(CONT_PROXY),$(IP_PROXY),$(PROXY_IMAGE),$(NETWORK2),$(PROXY_DIR),$(PROXY_ENVS))
	$(V)docker network connect --ip=$(IP_IDS2) $(NETWORK2) $(CONT_IDS)

net_config:
	$(V)$(call docker_exec,$(CONT_CLIENT)) -c "route del default gw $(GATEWAY)"
	$(V)$(call docker_exec,$(CONT_CLIENT)) -c "route add default gw $(IP_IDS)"
	$(V)$(call docker_exec,$(CONT_IDS)) -c \
		"iptables -t nat -A POSTROUTING -s $(SUBNET) -d 0.0.0.0/0 -o eth1 -j MASQUERADE"
	$(V)$(call docker_exec,$(CONT_IDS)) -c \
		"iptables -I FORWARD -j NFQUEUE"
	$(V)$(call docker_exec,$(CONT_CLIENT)) -c \
 		"iptables -A OUTPUT -p tcp --tcp-flags RST RST -j DROP"

exec_ids:
	$(V)$(call docker_exec,$(CONT_IDS))

exec_client:
	$(V)$(call docker_exec,$(CONT_CLIENT))

exec_proxy:
	$(V)$(call docker_exec,$(CONT_PROXY))

exec_server:
	$(V)$(call docker_exec,$(CONT_SERVER))

stop:
	$(V)docker stop $(CONTS)

start:
	$(V)docker start $(CONTS)

rm:
	$(V)docker rm $(CONTS)

clean: stop rm