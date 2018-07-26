FROM haskell:8.4

# install latex packages
RUN apt-get update -y \
  && apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern && \
  useradd -m pandoc

RUN mkdir -p /source && \
    chown pandoc:pandoc /source

# will ease up the update process
# updating this env variable will trigger the automatic build of the Docker image
USER pandoc
WORKDIR /home/pandoc

ARG PANDOC_VERSION="2.2.2.1"

# install pandoc
RUN cabal update && cabal install pandoc-${PANDOC_VERSION}

WORKDIR /source

ENTRYPOINT ["/home/pandoc/.cabal/bin/pandoc"]

CMD ["--help"]
