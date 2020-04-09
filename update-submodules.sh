#!/bin/bash
git submodule update --remote --merge --recursive
find vim/ -name doc -exec vim -u NONE -c "helptags {}" -c q \;
