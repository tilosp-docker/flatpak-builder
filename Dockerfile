FROM ubuntu

RUN set -ex; \
    apt-get update; \
    apt-get install -y software-properties-common; \
    add-apt-repository -y ppa:alexlarsson/flatpak; \
    apt-get update; \
    apt-get install -y flatpak-builder; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false software-properties-common; \
    rm -rf /var/lib/apt/lists/*

RUN flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo

RUN set -ex; \
    groupadd -g 1000 flatpak; \
    useradd -u 1000 -g 1000 -m -s /bin/bash flatpak

USER flatpak
