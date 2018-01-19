V          := @

IMAGE      := stackoverflow
CONTAINER  := stackoverflow-container

WORKDIR	   := /usr/src/app
DFLAGS     := --privileged -itd -v $(CURDIR)/src:$(WORKDIR) -p 1234:1234
BASH       := /bin/bash

DUMPDIR    := dump
DUMPFILE   := ./recho/recho
DUMPOUTPUT := recho.s

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

dump:
	$(V)mkdir -p src/$(DUMPDIR)
	$(V)docker exec -it $(CONTAINER) \
		$(BASH) -c "objdump -d $(DUMPFILE) > $(DUMPDIR)/$(DUMPOUTPUT)"
