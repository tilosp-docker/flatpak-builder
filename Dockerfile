FROM fedora

RUN set -ex; \
    dnf -y update; \
    dnf install -y flatpak-builder; \
    dnf clean all

RUN flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo
