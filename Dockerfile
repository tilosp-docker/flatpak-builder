FROM fedora

RUN set -ex; \
	dnf install -y \
		flatpak-builder \
        python3-requests \
        python3-gobject \
	; \
	dnf clean all

RUN set -ex; \
    curl -o /usr/bin/repoclient https://raw.githubusercontent.com/alexlarsson/repo-manager/0.1.1/repoclient; \
    chmod +x /usr/bin/repoclient

RUN set -ex; \
    groupadd -g 1000 flatpak; \
    useradd -u 1000 -g 1000 -m -s /bin/bash flatpak

USER flatpak

RUN flatpak remote-add --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
