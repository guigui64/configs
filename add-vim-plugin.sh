#!/bin/bash

[ $# != 1 ] && echo "Usage $0 URL" && exit 1

URL=$1
REPO=$(basename "$URL")
PLUGIN=${REPO%.*}
git submodule add "$URL" vim/pack/plugins/start/"$PLUGIN"
echo "$URL added to pack => don't forget to run update or to gen doc"

