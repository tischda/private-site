# ---------------------------------------------------------------------------
# Makefile for private-site
# ---------------------------------------------------------------------------

PROJECT_DIR=$(notdir $(shell pwd))

all: clean dist

clean:
	bin\clean

dist:
	bin\dist

dist-local:
	bin\dist-local

start: 
	bin\start

stop:
	bin\stop	

reload:
	bin\reload


.PHONY: dist
