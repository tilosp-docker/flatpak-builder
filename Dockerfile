FROM ubuntu

RUN set -ex; \
    dnf -y update; \
    dnf install -y flatpak-builder; \
    dnf clean all

RUN flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo

RUN groupadd -g 1000 flatpak \
    && useradd -u 1000 -g 1000 -m -s /bin/bash flatpak

USER flatpak
