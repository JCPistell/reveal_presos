#!/usr/bin/env bash

echo "Starting $1 presentation in dev mode..."

docker run -it --rm -p 8000:8000 \
  -v $PWD/$1/media:/reveal.js/media \
  -v $PWD/$1/css/custom.css:/reveal.js/css/custom.css \
  -v $PWD/$1/css/theme:/reveal.js/css/theme \
  -v $PWD/$1/plugin/asciinema:/reveal.js/plugin/asciinema \
  -v $PWD/$1/md:/reveal.js/md \
  -v $PWD/$1/index.html:/reveal.js/index.html \
  nbrown/revealjs

