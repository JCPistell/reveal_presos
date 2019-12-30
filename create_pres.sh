#!/usr/bin/env bash

set -e

if [ "$#" -ne 1 ]; then
    echo "You must enter a presentation name"
    exit 1
fi

echo "Createing presentation directory for $1"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PRES_DIR=$(echo $1 | sed 's/[[:space:]]/_/g' | tr [:upper:] [:lower:])

mkdir $DIR/$PRES_DIR
cp -R $DIR/template/* $DIR/$PRES_DIR

sed -i '' "s|<title>.*</title>|<title>$1</title>|g" $DIR/$PRES_DIR/index.html
