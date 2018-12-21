FROM ubuntu:16.04
RUN adduser --home /home/steam --disabled-password --shell /bin/bash --gecos "steam user" --quiet steam

RUN apt-get update && \
    apt-get install -y curl lib32gcc1 lib32stdc++6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /home/steam/steamcmd
WORKDIR /home/steam/steamcmd
RUN curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz && \
    chown -R steam /home/steam/steamcmd


USER steam
WORKDIR /home/steam/steamcmd
