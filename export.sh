#!/bin/bash

rm configs.zip
zip -r configs.zip .
cd ~/.config/ || exit 1
zip -ru ~/git/configs/configs.zip coc
cd - || exit 1
