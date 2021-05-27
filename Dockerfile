FROM debian

LABEL author="Jakub Michalski (lilabyte.cake@gmail.com, github.com/lilabyte)"
LABEL description="Deb Docker Image for Assetto Corsa Dedicated Server"
LABEL version="1.0"

# Remember to disable Steam Guard on your account
ENV STEAM_USERNAME="your_steam_username"
ENV STEAM_PASSWORD="your_steam_password"

ENV ACS_NAME="Assetto Corsa Server Deb Docker"
ENV ACS_PASSWORD=
ENV ACS_ADMIN_PASSWORD="serveradminpassword"
ENV ACS_TCP_PORT=9600
ENV ACS_UDP_PORT=9600
ENV ACS_HTTP_PORT=8081

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install lib32gcc1 curl && \
    mkdir /Steam && \
    cd /Steam

ADD acs_scripts/ /usr/local/bin

ENTRYPOINT ["acs_entry.sh"]
