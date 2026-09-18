.PHONY: bootstrap check build clean

bootstrap:
	sudo bash scripts/bootstrap-host.sh

check:
	bash scripts/check.sh

build: check
	bash scripts/build.sh

clean:
	rm -rf build
