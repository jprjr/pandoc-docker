FROM alpine:3.7
ARG PANDOC_VERSION="2.2.2.1"

RUN apk add --no-cache curl && \
    adduser -h /home/pandoc -D pandoc && \
    mkdir -p /source && \
    mkdir -p /home/pandoc/.local && \
    chown pandoc:pandoc /source && \
    chown pandoc:pandoc /home/pandoc/.local

USER pandoc
WORKDIR /home/pandoc

# install pandoc
RUN cd /home/pandoc/.local && \
    curl -R -L -O https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz && \
    tar xf pandoc-${PANDOC_VERSION}-linux.tar.gz && \
    mv pandoc-${PANDOC_VERSION}/* . && \
    rm -rf pandoc-${PANDOC_VERSION} pandoc-${PANDOC_VERSION}-linux.tar.gz

WORKDIR /source

ENTRYPOINT ["/home/pandoc/.local/bin/pandoc"]

CMD ["--help"]
