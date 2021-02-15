#!/bin/bash
git submodule update --init --remote --merge --recursive
vim -c "CocUpdateSync | q"
find vim/ -name doc -exec vim -u NONE -c "helptags {}" -c q \;
