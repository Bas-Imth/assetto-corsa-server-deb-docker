# Clear Assetto Corsa Server on Debian Docker

# Install

Docker image is available under the `lilabyte/assetto-corsa-server-deb-docker` name. You can build this image by yourself or use docker-compose instead.

Docker Compose File:
```yml
version: '3' 

services:
    acs:
        image: lilabyte/assetto-corsa-server-deb-docker
        container_name: acServer-deb
        ports:
            - 8081:8081
            - 9600:9600
            - 9600:9600/udp
        volumes:
            - /var/acServer-deb:/Steam/assetto #There will be stored all Assetto Corsa Server data including config and content folder.
        environment:
            # Remember to disable Steam Guard on your account
            - STEAM_USERNAME="yourSteamUsername"
            - STEAM_PASSWORD="yourSteamPassword"
            - ACS_NAME="Assetto Corsa Server Deb Docker"
            #- ACS_PASSWORD="yourServerPassword"
            - ACS_ADMIN_PASSWORD="superSecretServerAdminPassword"
            - ACS_TCP_PORT=9600
            - ACS_UDP_PORT=9600
            - ACS_HTTP_PORT=8081
        restart: unless-stopped
```

