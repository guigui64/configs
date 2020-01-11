#!/bin/bash
git submodule update --remote --merge --recursive
for doc in `find vim/ -name doc` ; do vim -u NONE -c "helptags $doc" -c q ; done
