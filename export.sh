#!/bin/bash

git archive -o configs.zip HEAD
git submodule --quiet foreach 'cd $toplevel; zip -ru configs.zip $sm_path'
zip -ru configs.zip vim/pack/plugins/start/coc.nvim-release
echo -e "Repository:\n$(git rev-parse HEAD)\nSubmodule status:\n$(git submodule status)" | zip -u configs.zip -z
