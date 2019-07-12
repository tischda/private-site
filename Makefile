# ---------------------------------------------------------------------------
# Makefile for private-site
# ---------------------------------------------------------------------------

# does not work, still uses my default TCC
SHELL = cmd.exe

PROJECT_DIR=$(notdir $(shell pwd))

all: clean dist

clean:
	cmd /c bin\clean

dist:
	cmd /c bin\dist

dist-local:
	cmd /c bin\dist-local

start: 
	cmd /c bin\start

stop:
	cmd /c bin\stop	

reload:
	cmd /c bin\reload


.PHONY: dist
