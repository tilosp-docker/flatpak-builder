FROM fedora

RUN set -ex; \
	dnf install -y \
		flatpak-builder \
        python3-requests \
        python3-gobject \
	; \
	dnf clean all

RUN set -ex; \
    curl -o /usr/bin/flat-manager-client https://raw.githubusercontent.com/flatpak/flat-manager/0.3.3/flat-manager-client; \
    chmod +x /usr/bin/flat-manager-client

RUN set -ex; \
    groupadd -g 1000 flatpak-builder; \
    useradd -u 1000 -g 1000 -m -s /bin/bash flatpak-builder

USER flatpak-builder

RUN set -ex; \
    flatpak remote-add --user flathub https://flathub.org/repo/flathub.flatpakrepo; \
    flatpak remote-add --user flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo; \
    flatpak remote-add --user fedora oci+https://registry.fedoraproject.org
