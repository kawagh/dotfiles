#!/bin/sh


DIR=$(dirname "$(realpath "$0")")
ln -sfv ${DIR}/nvim/init.lua ~/.config/nvim/init.lua
ln -sfv ${DIR}/.tmux.conf ~/.tmux.conf
ln -sfv ${DIR}/.ideavimrc ~/.ideavimrc
ln -sfv ${DIR}/.gitconfig ~/.gitconfig
ln -sfv ${DIR}/.tigrc ~/.tigrc
ln -sfv ${DIR}/.zshrc ~/.zshrc
mkdir -p ~/.config/zabrze
ln -sfv ${DIR}/.config/zabrze/config.yaml ~/.config/zabrze/config.yaml
ln -sfv ${DIR}/nvim/.luarc.json ~/.config/nvim/.luarc.json
