#!/bin/sh

cd /Steam

server() {
    ./steamcmd.sh \
        +@sSteamCmdForcePlatformType windows \
        +login ${STEAM_USERNAME} ${STEAM_PASSWORD} \
        +force_install_dir ./assetto/ \
        +app_update 302550 validate \
        +quit
}

if [ ! -f ./steamcmd.sh ]; then
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
fi

if [ ! -f ./assetto/acServer ]; then
    echo "\e[1;32mInstalling your Assetto Corsa Server\e[0m"
    server
    echo "\e[1;32mSetting up your Assetto Corsa Server\e[0m"
    cd ./assetto
    sed -i "
        s/NAME=AC_Server.*$/NAME=${ACS_NAME}/
        s/PASSWORD=.*/PASSWORD=${ACS_PASSWORD}/
        s/ADMIN_PASSWORD=.*/ADMIN_PASSWORD=${ACS_ADMIN_PASSWORD}/
        s/UDP_PORT=9600.*/UDP_PORT=${ACS_UDP_PORT}/
        s/TCP_PORT=9600.*/TCP_PORT=${ACS_TCP_PORT}/
        s/HTTP_PORT=8081.*/HTTP_PORT=${ACS_HTTP_PORT}/
    " cfg/server_cfg.ini
fi

if [ -f ./assetto/acServer ]; then
    echo "\e[1;33mChecking for Assetto Corsa Server updates\e[0m"
    server
fi