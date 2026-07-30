FROM ghcr.io/virtudude/armada@sha256:b3e0ae85eae59188a64f585a484a8cefdcad135e048fe0035bbf260e9fb5fdf3

ARG ARMADA_VERSION=unknown
LABEL org.opencontainers.image.version="${ARMADA_VERSION}"

COPY system_files/etc/containers/ /etc/containers/
COPY system_files/usr/lib/armada/update-lib /usr/lib/armada/update-lib
COPY system_files/usr/libexec/armada/armada-installer /usr/libexec/armada/armada-installer
COPY system_files/usr/libexec/armada/armada-update /usr/libexec/armada/armada-update

RUN printf '%s\n' "${ARMADA_VERSION}" >/usr/lib/armada/version && \
    chmod 0755 /usr/libexec/armada/armada-installer \
        /usr/libexec/armada/armada-update && \
    bootc container lint
