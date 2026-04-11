FROM quay.io/hyperfoil/hyperfoil:0.28.0
USER root
RUN microdnf install -y wget && \
    wget -q -O /usr/local/bin/mc https://dl.min.io/client/mc/release/linux-amd64/mc && \
    chmod +x /usr/local/bin/mc && \
    microdnf clean all
USER default
