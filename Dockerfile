FROM alpine:latest

ARG CODER_VERSION
LABEL \
	org.opencontainers.image.title="Coder" \
	org.opencontainers.image.description="A tool for provisioning self-hosted development environments with Terraform." \
	org.opencontainers.image.url="https://github.com/coder/coder" \
	org.opencontainers.image.source="https://github.com/coder/coder" \
	org.opencontainers.image.version="$CODER_VERSION"

COPY --chown=0:0 --chmod=644 group passwd /etc/
COPY --chown=1000:1000 --chmod=700 empty-dir /home/coder

COPY --chown=1000:1000 --chmod=755 coder /opt/coder

USER 1000:1000
ENV HOME=/home/coder
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt
WORKDIR /home/coder

ENTRYPOINT [ "/opt/coder", "server" ]
