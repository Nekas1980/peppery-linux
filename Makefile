.PHONY: bootstrap check build clean profiles profile-show profile-install

bootstrap:
	sudo bash scripts/bootstrap-host.sh

check:
	bash scripts/check.sh

build: check
	bash scripts/build.sh

profiles:
	bash scripts/peppery-profile.sh list

profile-show:
	@test -n "$(PROFILE)" || (echo "Uso: make profile-show PROFILE=forensics" && exit 1)
	bash scripts/peppery-profile.sh show "$(PROFILE)"

profile-install:
	@test -n "$(PROFILE)" || (echo "Uso: make profile-install PROFILE=forensics" && exit 1)
	sudo bash scripts/peppery-profile.sh install "$(PROFILE)"

clean:
	rm -rf build
