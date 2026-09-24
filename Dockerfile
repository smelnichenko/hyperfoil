FROM quay.io/hyperfoil/hyperfoil:0.28.0
# rclone uploads the run's report to the cluster's S3 gateway (versitygw). It replaced MinIO's mc on 2026-09-24:
# MinIO withdrew mc's download (dl.min.io 410) and its images. Pinned by version and checksum.
ARG RCLONE_VERSION=1.75.1
ARG RCLONE_SHA256=812d2ded3cf63dea9aa3ed082f185d975c85e1dd0a12f931f7148fb115ba5509
USER root
RUN curl -fsSL -o /tmp/rclone.rpm "https://github.com/rclone/rclone/releases/download/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.rpm" && \
    echo "${RCLONE_SHA256}  /tmp/rclone.rpm" | sha256sum -c - && \
    rpm -i --nodocs /tmp/rclone.rpm && \
    rm -f /tmp/rclone.rpm && \
    rclone version | head -1
USER default
