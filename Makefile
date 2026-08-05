# including my config file with private dev and username
include ../.config/Makefile

# Variablen definieren
REPO := Docker_ytdlp_debian
IMAGE_NAME := ytdlp_debian
CONTAINER_NAME := ytdlp_debian_container
DOCKERFILE := Dockerfile
LOWERCASE_UNAME :=  $(shell echo $(USERNAME) | tr '[:upper:]' '[:lower:]')

#COMPOSE_FILE := docker-compose.yml

.PHONY: help build run stop rm clean shell logs ghrc-login ghcr-build ghcr-push

# Standardziel: Hilfe anzeigen
help:  ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
# PODMAN TASKS
# Image bauen
build:  ## Image bauen
	podman build -t $(IMAGE_NAME) -f $(DOCKERFILE) .

# Container starten
run:    ## Container testweise starten und yt-dlp Version ausgeben
	podman run --name $(CONTAINER_NAME) --rm -it -v "$$(pwd):/out:z" "localhost/$(IMAGE_NAME)" --version

# Container stoppen
stop:   ## Container stop. Normaler Weise endet er nachdem yt-dlp die Arbeit erledigt hat
	podman stop $(CONTAINER_NAME)

# Container entfernen
rm:     ## Container manuell löschen, falls sie nicht gelöscht werden, z.B. bei einem Abbruch
	podman rm -f $(CONTAINER_NAME)

# Image und Container bereinigen
clean:  ## Image und Container bereinigen
	podman rmi -f $(IMAGE_NAME)

# Shell im Container öffnen
shell:  ## Shell im Container öffnen
	podman run --name $(CONTAINER_NAME) --rm -it --entrypoint /bin/sh $(IMAGE_NAME)

# Logs des Containers anzeigen
logs:   ## Logs des Containers anzeigen
	podman logs $(CONTAINER_NAME)

# Remote Login auf ghcr.io
ghcr-login:   ## Login auf gthc.io zur Vorbereitung des Remote Build-Prozesses, Access-Token ist zeitlich befristst
	echo $(ACCESSTOKEN) | podman login ghcr.io -u $(USEREMAIL) --password-stdin

# Remote Build Prozess starten
ghcr-build:   ## Remote Build Prozess starten
	podman build -t ghcr.io/$(LOWERCASE_UNAME)/$(IMAGE_NAME):latest .

# Remote Push Prozess starten
ghcr-push: ## Remote Push Prozess starten
	podman push ghcr.io/$(LOWERCASE_UNAME)/$(IMAGE_NAME):latest
#


