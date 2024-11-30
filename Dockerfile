FROM ubuntu:jammy
LABEL maintainer="Sean Cheung <theoxuanx@gmail.com>"

ARG TARGETPLATFORM
ARG VERSION

RUN set -ex && \
    apt-get update && \
    apt-get install -y curl libssl3 libssl-dev unzip && \
    mkdir -p /tmp/airconnect && \
    file_url=$(curl -sL "https://api.github.com/repos/philippe44/AirConnect/releases/tags/$VERSION" | grep "browser_download_url" | cut -d '"' -f 4) && \
    curl -sL -o /tmp/airconnect.zip "$file_url" && \
    unzip /tmp/airconnect.zip -d /tmp/airconnect/ && \
    bin_arc=linux-x86_64 && \
    if [ "$TARGETPLATFORM" = "linux/amd64" ]; then bin_arc=linux-x86_64; elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then bin_arc=linux-aarch64; elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then bin_arc=linux-arm; fi && \
    cp /tmp/airconnect/airupnp-$bin_arc /usr/bin/airupnp && \
    chmod +x /usr/bin/airupnp && \
    rm -rf /tmp/*

ENTRYPOINT [ "/usr/bin/airupnp" ]
CMD [ "-l", "1000:2000", "-Z" ]
