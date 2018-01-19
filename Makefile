V          := @

IMAGE      := stackoverflow
CONTAINER  := stackoverflow-container

WORKDIR	   := /usr/src/app
DFLAGS     := --privileged -itd -v $(CURDIR)/src:$(WORKDIR) -p 1234:1234
BASH       := /bin/bash

docker_run = docker run $(DFLAGS) --name $(CONTAINER) $(IMAGE)

docker_bash = $(docker_run) $(BASH) -c "$(1)"

# Get the Ubuntu environment
all: build run

clean: stop rm

exec:
	$(V)docker exec -it $(CONTAINER) $(BASH)

build:
	$(V)docker build -t $(IMAGE) .

run:
	$(V)$(docker_run)

stop:
	$(V)docker stop $(CONTAINER)

rm:
	$(V)docker rm $(CONTAINER)