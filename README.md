# Pandoc Docker Container

[Docker](https://www.docker.com/) container for the binary distribution of [Pandoc](https://pandoc.org/index.html).

Forked from [jagregory/pandoc](https://github.com/jagregory/pandoc-docker)

    docker run jprjr/pandoc

A `/source` directory is created in the container, which can be mapped for use with relative file paths. Pandoc will always be run from the `/source` directory in the container.

    docker run --rm -v $(pwd):/source jprjr/pandoc -f markdown -t html5 myfile.md -o myfile.html
