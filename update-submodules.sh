#!/bin/bash
git submodule update --remote --merge --recursive
cd vim/pack/plugins/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
vim -c "CocUpdateSync | q"
cd -
find vim/ -name doc -exec vim -u NONE -c "helptags {}" -c q \;
